# frontier_df4_ending -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df4_ending.o: \
  graphics/frontier_df4_ending/frontier_df4_ending_004_ACC378.bin.lz \
  graphics/frontier_df4_ending/frontier_df4_ending_011_B24D0C.bin.lz \
  graphics/frontier_df4_ending/frontier_df4_ending_019_B8B998.bin.lz \
  graphics/frontier_df4_ending/frontier_df4_ending_020_BAA2E0.bin.lz

