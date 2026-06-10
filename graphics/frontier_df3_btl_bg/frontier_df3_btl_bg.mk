# frontier_df3_btl_bg -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df3_btl_bg.o: \
  graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_000_7B40A8.bin.lz \
  graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_001_7B6E50.bin.lz

