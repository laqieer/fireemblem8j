# frontier_df3_ending -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.
#
# The two uncompressed raw-TSA composites _001_AC3AA8 (4576 B) and _002_AC50A4 (7156 B) are
# split byte-exact into descriptively named JP-only sub-assets, concatenated back under the
# kept base symbol in frontier_df3_ending.c (no build rule needed -- raw verbatim .bin):
#   _001 -> Tsa_DfEnding001_0..3.bin              (4 clean raw TSA tilemaps, hdr 0x131D/0x111D)
#   _002 -> Tsa_DfEnding002.bin (raw TSA)         + dat_DfEnding002_PalGfx.bin (opaque
#           palette+4bpp-gfx data block; NOT a clean BGR555 palette -- 39% bit15-set).

