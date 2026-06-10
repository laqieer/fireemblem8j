# frontier_map_objtype -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_map_objtype.o: \
  graphics/frontier_map_objtype/frontier_map_objtype_000_17B398.bin.lz \
  graphics/frontier_map_objtype/frontier_map_objtype_001_181610.bin.lz \
  graphics/frontier_map_objtype/frontier_map_objtype_002_188888.bin.lz

