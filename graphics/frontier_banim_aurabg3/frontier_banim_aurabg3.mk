# frontier_banim_aurabg3 -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.




# --- mindist pins (hybrid JP-LZ sheets) ---

graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_016a_7767BC.map.bin.lz: LZ_FLAGS := -mindist 1

graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_028a_777858.map.bin.lz: LZ_FLAGS := -mindist 1
