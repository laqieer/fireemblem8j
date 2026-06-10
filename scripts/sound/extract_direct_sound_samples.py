#!/usr/bin/env python3
"""Extract FE8J's direct-sound PCM samples to committed `.aif` source.

`asm/direct_sound_data.s` is the single biggest `.incbin "baserom.gba"` blob in
the repo: 3,272,220 bytes (~20% of self-containment) of m4a/sappy direct-sound
PCM samples. This script replaces that baserom dependency with COMMITTED `.aif`
source compiled by `tools/aif2pcm` (the pret m4a sample tool) -- exactly how the
US decomp (../fireemblem8u) represents the same data.

Why this is byte-exact (verified): every one of FE8J's 439 samples is
byte-identical to the US `aif2pcm` output for the corresponding `.aif`, up to a
0-3 byte trailing zero-pad that the assembler's `.align 2` (4-byte) directive
reproduces. (The JP sample SET equals the US sample SET; the JP `.incbin` sizes
just bake in the inter-sample alignment padding.) So:

    .align 2
    .incbin "sound/direct_sound_samples/<name>.bin"   # <- aif2pcm(<name>.aif)

reproduces each JP sample's bytes AND its trailing pad. The `.bin` is a build
intermediate (gitignored); the `.aif` is the committed source of truth.

What this does:
  1. For each `DirectSoundData_<name>` entry in asm/direct_sound_data.s, find the
     US `.aif` whose aif2pcm output matches the JP ROM bytes (content-addressed,
     so US naming differences don't matter), and copy it to
     sound/direct_sound_samples/<name>.aif (the JP symbol name).
  2. Rewrite asm/direct_sound_data.s to `.incbin` the rebuilt `.bin` + `.align 2`
     instead of `.incbin "baserom.gba"`.

Run from the repo root. Requires tools/aif2pcm built (scripts/tools/aif2pcm/setup.sh)
and the sibling US decomp with its committed sound/direct_sound_samples/*.aif.
`make compare` (and the clean rebuild) remain the oracle.
"""
import glob
import os
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.chdir(ROOT)

AIF2PCM = os.path.join(ROOT, "tools", "aif2pcm", "aif2pcm")
SAMPLE_DIR = os.path.join(ROOT, "sound", "direct_sound_samples")
SRC_S = os.path.join(ROOT, "asm", "direct_sound_data.s")

# Locate the sibling US decomp (worktree-aware).
def find_fe8u():
    if os.environ.get("FE8U"):
        return os.environ["FE8U"]
    common = subprocess.run(
        ["git", "rev-parse", "--path-format=absolute", "--git-common-dir"],
        capture_output=True, text=True).stdout.strip()
    main_root = re.sub(r"/\.git$", "", common)
    for cand in (os.path.join(ROOT, "..", "fireemblem8u"),
                 os.path.join(main_root, "..", "fireemblem8u"),
                 os.path.expanduser("~/fireemblem8u"),
                 "/home/laqieer/fireemblem8u"):
        if os.path.isdir(os.path.join(cand, "sound", "direct_sound_samples")):
            return os.path.abspath(cand)
    sys.exit("ERROR: could not locate sibling US decomp (set FE8U=/path).")


ENTRY_RE = re.compile(
    r'\.global (DirectSoundData_\S+)\n(\S+):\n\s*'
    r'\.incbin "baserom\.gba", (0x[0-9A-Fa-f]+), (0x[0-9A-Fa-f]+)')


def build_us_content_map(fe8u):
    """content (aif2pcm output bytes) -> US .aif basename (first wins for dups)."""
    if not os.access(AIF2PCM, os.X_OK):
        sys.exit(f"ERROR: aif2pcm not built at {AIF2PCM} "
                 f"(run scripts/tools/aif2pcm/setup.sh).")
    content2aif = {}
    tmp = tempfile.mkdtemp()
    for a in sorted(glob.glob(os.path.join(fe8u, "sound/direct_sound_samples/*.aif"))):
        base = os.path.basename(a)[:-4]
        outp = os.path.join(tmp, base + ".bin")
        subprocess.run([AIF2PCM, a, outp], check=True, capture_output=True)
        content2aif.setdefault(open(outp, "rb").read(), (a, base))
    return content2aif


def match(jpb, content2aif):
    """Return (aif_path, us_base, bin_len) for the US sample matching jpb (with
    optional trailing zero-pad), or None."""
    if jpb in content2aif:
        a, b = content2aif[jpb]
        return a, b, len(jpb)
    for c, (a, b) in content2aif.items():
        if len(jpb) >= len(c) and jpb[:len(c)] == c and all(x == 0 for x in jpb[len(c):]):
            return a, b, len(c)
    return None


def main():
    fe8u = find_fe8u()
    jp = open(os.path.join(ROOT, "baserom.gba"), "rb").read()
    text = open(SRC_S).read()
    entries = ENTRY_RE.findall(text)
    if not entries:
        sys.exit("ERROR: no DirectSoundData entries found (already extracted?).")
    content2aif = build_us_content_map(fe8u)

    os.makedirs(SAMPLE_DIR, exist_ok=True)
    body = []
    body.append("\t.section .rodata.direct_sound_data, \"a\", %progbits")
    body.append("\t.align 2")
    body.append("@ M4A/sappy direct-sound PCM samples (JP 0x08216064 .. 0x08534E80,")
    body.append("@ 3272220 bytes). Built from committed AIFF source via tools/aif2pcm")
    body.append("@ (scripts/tools/aif2pcm/setup.sh) -- NO baserom.gba dependency. The")
    body.append("@ JP sample set is byte-identical to the US decomp's; each `.align 2`")
    body.append("@ reproduces the 0-3 byte inter-sample alignment pad. See docs/sound.md.")

    unmatched = []
    for gname, label, off, size in entries:
        offi, sizei = int(off, 16), int(size, 16)
        jpb = jp[offi:offi + sizei]
        m = match(jpb, content2aif)
        if m is None:
            unmatched.append(label)
            continue
        aif_path, _us_base, _binlen = m
        # JP sample name = symbol minus the DirectSoundData_ prefix.
        jp_name = label[len("DirectSoundData_"):]
        dst_aif = os.path.join(SAMPLE_DIR, jp_name + ".aif")
        shutil.copyfile(aif_path, dst_aif)
        body.append("")
        body.append("\t.align 2")
        body.append(f"\t.global {label}")
        body.append(f"{label}:")
        body.append(f"\t.incbin \"sound/direct_sound_samples/{jp_name}.bin\"")

    if unmatched:
        sys.exit(f"ERROR: {len(unmatched)} samples had no US .aif match: "
                 f"{unmatched[:10]} ...; aborting (no partial rewrite).")

    # Trailing .align 2: the LAST sample's bytes are 4-aligned in the ROM too
    # (the next region begins on a 4-byte boundary), so the section must include
    # the last sample's own alignment pad -- without this the section is 1-3 bytes
    # short and every following region shifts.
    body.append("")
    body.append("\t.align 2")
    body.append("")
    with open(SRC_S, "w") as f:
        f.write("\n".join(body) + "\n")

    print(f"extracted {len(entries)} samples -> {SAMPLE_DIR}/*.aif")
    print(f"rewrote {SRC_S} to incbin rebuilt .bin (aif2pcm) instead of baserom.gba")


if __name__ == "__main__":
    main()
