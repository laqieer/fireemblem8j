# frontier_df4_uistuff -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df4_uistuff.o: \
  graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.bin.lz

