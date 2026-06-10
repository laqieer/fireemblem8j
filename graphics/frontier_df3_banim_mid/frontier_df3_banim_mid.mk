# frontier_df3_banim_mid -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df3_banim_mid.o: \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_007_656EA8.gbapal

