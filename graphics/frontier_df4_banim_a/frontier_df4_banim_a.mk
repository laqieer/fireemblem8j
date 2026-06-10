# frontier_df4_banim_a -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df4_banim_a.o: \
  graphics/frontier_df4_banim_a/frontier_df4_banim_a_003_5E4570.bin.lz \
  graphics/frontier_df4_banim_a/frontier_df4_banim_a_004_5E4E84.bin.lz \
  graphics/frontier_df4_banim_a/frontier_df4_banim_a_005_5EA510.bin.lz \
  graphics/frontier_df4_banim_a/frontier_df4_banim_a_006_5EBF04.bin.lz

