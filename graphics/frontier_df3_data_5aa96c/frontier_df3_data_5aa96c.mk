# frontier_df3_data_5aa96c -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df3_data_5aa96c.o: \
  graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_008_5D8048.gbapal

