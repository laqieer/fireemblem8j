#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'EOF'
usage: scripts/shiftcheck/boot_smoke.sh <rom.gba> [outdir]

Rootless mGBA/Xvfb boot-smoke harness. It downloads/extracts the Ubuntu mGBA SDL
.deb and small missing SDL runtime deps into .boot_smoke_work/prefix if needed,
runs the ROM under Xvfb for a short wall-clock budget, captures Xvfb framebuffer
snapshots, converts them to PNG, and fails on blank/static output or suspicious
emulator log errors.
EOF
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

ROOT=${BOOT_SMOKE_ROOT:-.boot_smoke_work}
DEBS="$ROOT/debs"
PREFIX="$ROOT/prefix"
BASE_OUT=${2:-$ROOT/boot-smoke-$(date -u +%Y%m%dT%H%M%SZ)}
OUT=$BASE_OUT
mkdir -p "$DEBS" "$PREFIX" "$OUT"

log() { printf '[boot-smoke] %s\n' "$*"; }

download_deb() {
    pkg=$1
    pattern=$2
    if ls "$DEBS"/$pattern >/dev/null 2>&1; then
        return 0
    fi
    log "downloading $pkg (.deb, rootless)"
    (cd "$DEBS" && apt-get download "$pkg") >> "$OUT/bootstrap.log" 2>&1
}

bootstrap_mgba() {
    if [ -x "$PREFIX/usr/games/mgba" ]; then
        return 0
    fi
    : > "$OUT/bootstrap.log"
    download_deb mgba-sdl 'mgba-sdl_*.deb'
    download_deb libsdl2-2.0-0 'libsdl2-2.0-0_*.deb'
    download_deb libxss1 'libxss1_*.deb'
    download_deb libdecor-0-0 'libdecor-0-0_*.deb'
    for deb in "$DEBS"/mgba-sdl_*.deb "$DEBS"/libsdl2-2.0-0_*.deb "$DEBS"/libxss1_*.deb "$DEBS"/libdecor-0-0_*.deb; do
        dpkg-deb -x "$deb" "$PREFIX"
    done
}

if ! command -v Xvfb >/dev/null 2>&1; then
    echo "FAIL: Xvfb is not available. Install/extract xvfb first, then rerun." >&2
    exit 1
fi

bootstrap_mgba
MGBA="$PREFIX/usr/games/mgba"
if [ ! -x "$MGBA" ]; then
    echo "FAIL: extracted mGBA binary not found at $MGBA" >&2
    exit 1
fi

export LD_LIBRARY_PATH="$PWD/$PREFIX/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH:-}"
if ldd "$MGBA" > "$OUT/ldd.log" 2>&1 && grep -q 'not found' "$OUT/ldd.log"; then
    echo "FAIL: mGBA has unresolved shared libraries; see $OUT/ldd.log" >&2
    cat "$OUT/ldd.log" >&2
    exit 1
fi

FBDIR="$OUT/fb"
mkdir -p "$FBDIR"
DISPLAY_NUM=$((180 + ($$ % 60)))
export DISPLAY=:$DISPLAY_NUM
export SDL_VIDEODRIVER=x11
export SDL_AUDIODRIVER=dummy

RUN_SECONDS=${BOOT_SMOKE_SECONDS:-12}
CAPTURE_A=${BOOT_SMOKE_CAPTURE_A:-3}
CAPTURE_B=${BOOT_SMOKE_CAPTURE_B:-10}
if [ "$CAPTURE_B" -ge "$RUN_SECONDS" ]; then
    echo "FAIL: BOOT_SMOKE_CAPTURE_B must be less than BOOT_SMOKE_SECONDS" >&2
    exit 1
fi

log "starting Xvfb on DISPLAY=$DISPLAY"
timeout "$((RUN_SECONDS + 3))s" Xvfb "$DISPLAY" -nolisten unix -screen 0 480x320x24 -fbdir "$PWD/$FBDIR" > "$OUT/xvfb.log" 2>&1 &
XVFB_JOB=$!
sleep 1

log "running mGBA for ${RUN_SECONDS}s: $ROM"
set +e
timeout "${RUN_SECONDS}s" "$MGBA" -2 -l 63 "$ROM" > "$OUT/mgba.log" 2>&1 &
MGBA_JOB=$!
sleep "$CAPTURE_A"
cp "$FBDIR/Xvfb_screen0" "$OUT/frame_${CAPTURE_A}s.xwd" 2>> "$OUT/harness.log"
sleep "$((CAPTURE_B - CAPTURE_A))"
cp "$FBDIR/Xvfb_screen0" "$OUT/frame_${CAPTURE_B}s.xwd" 2>> "$OUT/harness.log"
wait "$MGBA_JOB"
MGBA_RC=$?
wait "$XVFB_JOB"
XVFB_RC=$?
set -e
printf 'mgba_timeout_rc=%s\nxvfb_timeout_rc=%s\n' "$MGBA_RC" "$XVFB_RC" > "$OUT/exit_codes.txt"

python3 - "$OUT/frame_${CAPTURE_A}s.xwd" "$OUT/frame_${CAPTURE_B}s.xwd" > "$OUT/frame_metrics.tsv" <<'PY'
import hashlib
import pathlib
import struct
import sys
import zlib

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
            row += bytes((r, g, b))
        rows.append(bytes([0]) + bytes(row))
    raw = b''.join(rows)
    png = (b'\x89PNG\r\n\x1a\n' +
           chunk(b'IHDR', struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0)) +
           chunk(b'IDAT', zlib.compress(raw, 9)) +
           chunk(b'IEND', b''))
    out = pathlib.Path(path).with_suffix('.png')
    out.write_bytes(png)
    return out, hashlib.sha256(png).hexdigest(), nonzero, len(unique)

for arg in sys.argv[1:]:
    out, digest, nonzero, unique = xwd_to_png(arg)
    print(f'{out}\t{digest}\tnonzero={nonzero}\tunique_rgb={unique}')
PY

PNG_A="$OUT/frame_${CAPTURE_A}s.png"
PNG_B="$OUT/frame_${CAPTURE_B}s.png"
HASH_A=$(sha256sum "$PNG_A" | awk '{print $1}')
HASH_B=$(sha256sum "$PNG_B" | awk '{print $1}')
NONZERO_B=$(awk -F'\t' 'END{for(i=1;i<=NF;i++) if ($i ~ /^nonzero=/) {sub(/^nonzero=/,"",$i); print $i}}' "$OUT/frame_metrics.tsv")
UNIQUE_B=$(awk -F'\t' 'END{for(i=1;i<=NF;i++) if ($i ~ /^unique_rgb=/) {sub(/^unique_rgb=/,"",$i); print $i}}' "$OUT/frame_metrics.tsv")

if grep -Eiq 'illegal|undefined|crash|segmentation|assert|bad memory|bus error|fatal' "$OUT/mgba.log"; then
    echo "FAIL: suspicious emulator log entry found; see $OUT/mgba.log" >&2
    grep -Ein 'illegal|undefined|crash|segmentation|assert|bad memory|bus error|fatal' "$OUT/mgba.log" >&2 || true
    exit 1
fi
if ! grep -Eq 'GBA (BIOS|DMA|Memory|Savedata)' "$OUT/mgba.log"; then
    echo "FAIL: mGBA log does not show GBA execution; see $OUT/mgba.log" >&2
    exit 1
fi
if [ "$HASH_A" = "$HASH_B" ]; then
    echo "FAIL: framebuffer did not change between ${CAPTURE_A}s and ${CAPTURE_B}s; see $OUT" >&2
    exit 1
fi
if [ "$NONZERO_B" -le 1000 ] || [ "$UNIQUE_B" -le 4 ]; then
    echo "FAIL: final framebuffer looks blank/degenerate; nonzero=$NONZERO_B unique_rgb=$UNIQUE_B" >&2
    exit 1
fi

cat > "$OUT/summary.txt" <<EOF
PASS boot-smoke
rom=$ROM
rom_size=$ROM_SIZE
out=$OUT
mgba=$MGBA
run_seconds=$RUN_SECONDS
png_${CAPTURE_A}s=$PNG_A sha256=$HASH_A
png_${CAPTURE_B}s=$PNG_B sha256=$HASH_B
final_nonzero_pixels=$NONZERO_B
final_unique_rgb=$UNIQUE_B
log=$OUT/mgba.log
pass_criteria=GBA execution log present; no suspicious crash/illegal/fatal log entries; framebuffer changes; final framebuffer non-blank.
EOF
cat "$OUT/summary.txt"
