#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'USAGE'
usage: scripts/shiftcheck/play_smoke.sh <rom.gba> [outdir]

Rootless mGBA/Xvfb play-smoke harness. Reuses .boot_smoke_work/prefix,
runs longer than boot_smoke, injects blind START/A/B keypresses through X11,
captures progression PNGs, and fails on suspicious emulator log errors or
blank/static framebuffer output.

Environment knobs:
  PLAY_SMOKE_SECONDS="45"          total run time
  PLAY_SMOKE_CAPTURES="5 20 40"    capture times, each < total seconds
  PLAY_SMOKE_INPUT_INTERVAL="0.7"  delay between input bursts
  PLAY_SMOKE_ROOT=".boot_smoke_work"
USAGE
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ] || [ "$#" -lt 1 ]; then
    usage
    exit 2
fi

ROM=$1
if [ ! -r "$ROM" ]; then
    echo "FAIL: ROM is not readable: $ROM" >&2
    exit 1
fi

ROM_SIZE=$(wc -c < "$ROM")
if [ "$ROM_SIZE" -gt 33554432 ]; then
    echo "FAIL: ROM is larger than 32 MiB: $ROM_SIZE bytes" >&2
    exit 1
fi

ROOT=${PLAY_SMOKE_ROOT:-.boot_smoke_work}
DEBS="$ROOT/debs"
PREFIX="$ROOT/prefix"
BASE_OUT=${2:-$ROOT/play-smoke-$(date -u +%Y%m%dT%H%M%SZ)}
OUT=$BASE_OUT
mkdir -p "$DEBS" "$PREFIX" "$OUT"

log() { printf '[play-smoke] %s\n' "$*"; }

DOWNLOAD_LOG="$OUT/bootstrap.log"
touch "$DOWNLOAD_LOG"

download_deb() {
    pkg=$1
    pattern=$2
    if ls "$DEBS"/$pattern >/dev/null 2>&1; then
        return 0
    fi
    log "downloading $pkg (.deb, rootless)"
    (cd "$DEBS" && apt-get download "$pkg") >> "$DOWNLOAD_LOG" 2>&1
}

bootstrap_mgba() {
    if [ -x "$PREFIX/usr/games/mgba" ]; then
        return 0
    fi
    download_deb mgba-sdl 'mgba-sdl_*.deb'
    download_deb libsdl2-2.0-0 'libsdl2-2.0-0_*.deb'
    download_deb libxss1 'libxss1_*.deb'
    download_deb libdecor-0-0 'libdecor-0-0_*.deb'
    for deb in "$DEBS"/mgba-sdl_*.deb "$DEBS"/libsdl2-2.0-0_*.deb "$DEBS"/libxss1_*.deb "$DEBS"/libdecor-0-0_*.deb; do
        dpkg-deb -x "$deb" "$PREFIX"
    done
}

bootstrap_xdotool() {
    if command -v xdotool >/dev/null 2>&1; then
        XDOTOOL=$(command -v xdotool)
        return 0
    fi
    if [ ! -x "$PREFIX/usr/bin/xdotool" ]; then
        download_deb xdotool 'xdotool_*.deb'
        download_deb libxdo3 'libxdo3_*.deb'
        for deb in "$DEBS"/libxdo3_*.deb "$DEBS"/xdotool_*.deb; do
            dpkg-deb -x "$deb" "$PREFIX"
        done
    fi
    XDOTOOL="$PREFIX/usr/bin/xdotool"
    if [ ! -x "$XDOTOOL" ]; then
        echo "FAIL: xdotool unavailable; see $DOWNLOAD_LOG" >&2
        exit 1
    fi
}

if ! command -v Xvfb >/dev/null 2>&1; then
    echo "FAIL: Xvfb is not available." >&2
    exit 1
fi

bootstrap_mgba
bootstrap_xdotool
MGBA="$PREFIX/usr/games/mgba"
if [ ! -x "$MGBA" ]; then
    echo "FAIL: mGBA binary not found at $MGBA" >&2
    exit 1
fi

export LD_LIBRARY_PATH="$PWD/$PREFIX/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH:-}"
if ldd "$MGBA" > "$OUT/ldd-mgba.log" 2>&1 && grep -q 'not found' "$OUT/ldd-mgba.log"; then
    echo "FAIL: mGBA has unresolved shared libraries; see $OUT/ldd-mgba.log" >&2
    cat "$OUT/ldd-mgba.log" >&2
    exit 1
fi
if ldd "$XDOTOOL" > "$OUT/ldd-xdotool.log" 2>&1 && grep -q 'not found' "$OUT/ldd-xdotool.log"; then
    echo "FAIL: xdotool has unresolved shared libraries; see $OUT/ldd-xdotool.log" >&2
    cat "$OUT/ldd-xdotool.log" >&2
    exit 1
fi

RUN_SECONDS=${PLAY_SMOKE_SECONDS:-45}
CAPTURES=${PLAY_SMOKE_CAPTURES:-"5 20 40"}
INPUT_INTERVAL=${PLAY_SMOKE_INPUT_INTERVAL:-0.7}
for t in $CAPTURES; do
    case $t in *[!0-9]*|'') echo "FAIL: PLAY_SMOKE_CAPTURES must be integer seconds" >&2; exit 1;; esac
    if [ "$t" -ge "$RUN_SECONDS" ]; then
        echo "FAIL: capture time $t must be less than PLAY_SMOKE_SECONDS=$RUN_SECONDS" >&2
        exit 1
    fi
 done

FBDIR="$OUT/fb"
SAVEDIR="$OUT/save"
mkdir -p "$FBDIR" "$SAVEDIR"
ROM_RUN="$ROM"
case "$ROM" in
    *.gba) ROM_BASENAME=$(basename "$ROM") ;;
    *) ROM_BASENAME=play_smoke.gba ;;
esac
cp "$ROM" "$SAVEDIR/$ROM_BASENAME"
ROM_RUN="$SAVEDIR/$ROM_BASENAME"

DISPLAY_NUM=$((240 + ($$ % 50)))
export DISPLAY=:$DISPLAY_NUM
export SDL_VIDEODRIVER=x11
export SDL_AUDIODRIVER=dummy

XVFB_JOB=
MGBA_JOB=
INPUT_JOB=
cleanup() {
    set +e
    if [ -n "${INPUT_JOB:-}" ] && kill -0 "$INPUT_JOB" 2>/dev/null; then kill "$INPUT_JOB" 2>/dev/null; fi
    if [ -n "${MGBA_JOB:-}" ] && kill -0 "$MGBA_JOB" 2>/dev/null; then kill "$MGBA_JOB" 2>/dev/null; fi
    if [ -n "${XVFB_JOB:-}" ] && kill -0 "$XVFB_JOB" 2>/dev/null; then kill "$XVFB_JOB" 2>/dev/null; fi
}
trap cleanup EXIT INT TERM

log "starting Xvfb on DISPLAY=$DISPLAY"
timeout "$((RUN_SECONDS + 5))s" Xvfb "$DISPLAY" -nolisten unix -screen 0 480x320x24 -fbdir "$PWD/$FBDIR" > "$OUT/xvfb.log" 2>&1 &
XVFB_JOB=$!
sleep 1

log "running mGBA for ${RUN_SECONDS}s: $ROM_RUN"
set +e
timeout "${RUN_SECONDS}s" "$MGBA" -2 -l 63 "$ROM_RUN" > "$OUT/mgba.log" 2>&1 &
MGBA_JOB=$!

(
    set +e
    sleep 2
    win=""
    for _ in $(seq 1 20); do
        win=$($XDOTOOL search --pid "$MGBA_JOB" 2>> "$OUT/input.log" | head -1)
        [ -n "$win" ] && break
        win=$($XDOTOOL search --name 'mGBA' 2>> "$OUT/input.log" | head -1)
        [ -n "$win" ] && break
        sleep 0.25
    done
    if [ -n "$win" ]; then
        echo "window=$win" >> "$OUT/input.log"
        $XDOTOOL windowfocus "$win" 2>> "$OUT/input.log"
    else
        echo "WARN: no mGBA window found; sending keys to focused X display" >> "$OUT/input.log"
    fi
    end=$((SECONDS + RUN_SECONDS - 3))
    burst=0
    while [ "$SECONDS" -lt "$end" ]; do
        burst=$((burst + 1))
        # GBA defaults in mGBA SDL: Return=START, x=A, z=B, arrow keys=d-pad.
        if [ -n "$win" ]; then
            $XDOTOOL windowfocus "$win" 2>> "$OUT/input.log"
            $XDOTOOL key --clearmodifiers Return x Return x z x Return 2>> "$OUT/input.log"
        else
            $XDOTOOL key --clearmodifiers Return x Return x z x Return 2>> "$OUT/input.log"
        fi
        printf 'burst=%s seconds=%s\n' "$burst" "$SECONDS" >> "$OUT/input.log"
        sleep "$INPUT_INTERVAL"
    done
) &
INPUT_JOB=$!

prev=0
for t in $CAPTURES; do
    sleep "$((t - prev))"
    cp "$FBDIR/Xvfb_screen0" "$OUT/frame_${t}s.xwd" 2>> "$OUT/harness.log"
    prev=$t
 done
wait "$MGBA_JOB"
MGBA_RC=$?
if [ -n "${INPUT_JOB:-}" ]; then wait "$INPUT_JOB"; INPUT_RC=$?; else INPUT_RC=0; fi
wait "$XVFB_JOB"
XVFB_RC=$?
set -e
trap - EXIT INT TERM
printf 'mgba_timeout_rc=%s\nxvfb_timeout_rc=%s\ninput_rc=%s\n' "$MGBA_RC" "$XVFB_RC" "$INPUT_RC" > "$OUT/exit_codes.txt"

python3 - "$OUT" $CAPTURES > "$OUT/frame_metrics.tsv" <<'PY'
import hashlib
import pathlib
import struct
import sys
import zlib

outdir = pathlib.Path(sys.argv[1])
times = sys.argv[2:]

def chunk(t, d):
    return len(d).to_bytes(4, 'big') + t + d + zlib.crc32(t + d).to_bytes(4, 'big')

def xwd_to_png(path):
    data = pathlib.Path(path).read_bytes()
    if len(data) < 100:
        raise SystemExit(f'bad XWD: {path}')
    vals = struct.unpack('>25I', data[:100])
    header_size, _version, _format, depth, width, height, _xoff, byte_order, _unit, _pad, _bits_plane, bits_pixel, bytes_line, _visual, red_mask, green_mask, blue_mask, _bprgb, _entries, ncolors, *_ = vals
    if depth != 24 or bits_pixel != 32:
        raise SystemExit(f'unsupported XWD depth/bpp in {path}: depth={depth} bpp={bits_pixel}')
    off = header_size + ncolors * 12
    pixels = data[off:off + bytes_line * height]
    if len(pixels) < bytes_line * height:
        raise SystemExit(f'truncated XWD pixel data: {path}')
    rows = []
    nonzero = 0
    unique = set()
    endian = 'big' if byte_order == 0 else 'little'
    rshift = (red_mask & -red_mask).bit_length() - 1
    gshift = (green_mask & -green_mask).bit_length() - 1
    bshift = (blue_mask & -blue_mask).bit_length() - 1
    sample = bytearray()
    for y in range(height):
        line = pixels[y * bytes_line:y * bytes_line + bytes_line]
        row = bytearray()
        for x in range(width):
            px = int.from_bytes(line[x * 4:x * 4 + 4], endian)
            r = (px & red_mask) >> rshift
            g = (px & green_mask) >> gshift
            b = (px & blue_mask) >> bshift
            if r or g or b:
                nonzero += 1
            unique.add((r, g, b))
            rgb = bytes((r, g, b))
            row += rgb
            sample += rgb
        rows.append(bytes([0]) + bytes(row))
    raw = b''.join(rows)
    png = (b'\x89PNG\r\n\x1a\n' +
           chunk(b'IHDR', struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)) +
           chunk(b'IDAT', zlib.compress(raw, 9)) +
           chunk(b'IEND', b''))
    png_path = pathlib.Path(path).with_suffix('.png')
    png_path.write_bytes(png)
    return png_path, hashlib.sha256(png).hexdigest(), hashlib.sha256(bytes(sample)).hexdigest(), nonzero, len(unique)

for t in times:
    xwd = outdir / f'frame_{t}s.xwd'
    png, png_hash, raw_hash, nonzero, unique = xwd_to_png(xwd)
    print(f'{t}\t{png}\tsha256_png={png_hash}\tsha256_rgb={raw_hash}\tnonzero={nonzero}\tunique_rgb={unique}')
PY

if grep -Eiq 'illegal|undefined|crash|segmentation|assert|bad memory|bus error|fatal' "$OUT/mgba.log"; then
    echo "FAIL: suspicious emulator log entry found; see $OUT/mgba.log" >&2
    grep -Ein 'illegal|undefined|crash|segmentation|assert|bad memory|bus error|fatal' "$OUT/mgba.log" >&2 || true
    exit 1
fi
if ! grep -Eq 'GBA (BIOS|DMA|Memory|Savedata)' "$OUT/mgba.log"; then
    echo "FAIL: mGBA log does not show GBA execution; see $OUT/mgba.log" >&2
    exit 1
fi

DISTINCT=$(awk -F'\t' '{for(i=1;i<=NF;i++) if ($i ~ /^sha256_rgb=/) {print $i}}' "$OUT/frame_metrics.tsv" | sort -u | wc -l)
MIN_NONZERO=$(awk -F'\t' 'BEGIN{m=999999999} {for(i=1;i<=NF;i++) if ($i ~ /^nonzero=/) {v=$i; sub(/^nonzero=/,"",v); if (v<m) m=v}} END{print m}' "$OUT/frame_metrics.tsv")
MAX_UNIQUE=$(awk -F'\t' 'BEGIN{m=0} {for(i=1;i<=NF;i++) if ($i ~ /^unique_rgb=/) {v=$i; sub(/^unique_rgb=/,"",v); if (v>m) m=v}} END{print m}' "$OUT/frame_metrics.tsv")
if [ "$DISTINCT" -lt 2 ]; then
    echo "FAIL: captured framebuffer did not show distinct screens; see $OUT/frame_metrics.tsv" >&2
    exit 1
fi
if [ "$MIN_NONZERO" -le 1000 ] || [ "$MAX_UNIQUE" -le 4 ]; then
    echo "FAIL: captured framebuffers look blank/degenerate; min_nonzero=$MIN_NONZERO max_unique=$MAX_UNIQUE" >&2
    exit 1
fi

{
    echo "PASS play-smoke"
    echo "rom=$ROM"
    echo "rom_size=$ROM_SIZE"
    echo "out=$OUT"
    echo "mgba=$MGBA"
    echo "xdotool=$XDOTOOL"
    echo "run_seconds=$RUN_SECONDS"
    echo "captures=$CAPTURES"
    echo "distinct_rgb_frames=$DISTINCT"
    echo "min_nonzero_pixels=$MIN_NONZERO"
    echo "max_unique_rgb=$MAX_UNIQUE"
    echo "log=$OUT/mgba.log"
    echo "input_log=$OUT/input.log"
    echo "frames:"
    cat "$OUT/frame_metrics.tsv"
    echo "pass_criteria=GBA execution log present; no suspicious crash/illegal/fatal log entries; X11 START/A/B input bursts sent; captured framebuffers are non-blank and include distinct screens."
} > "$OUT/summary.txt"
cat "$OUT/summary.txt"
