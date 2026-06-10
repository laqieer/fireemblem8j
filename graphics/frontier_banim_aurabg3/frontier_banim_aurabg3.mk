# frontier_banim_aurabg3 -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_banim_aurabg3.o: \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_000_76E98C.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_001_76FE78.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_002_771224.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_003_7725D4.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_005_774CB8.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_006_774F30.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_007_7751A8.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_008_775420.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_009_775698.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_010_775908.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_011_775B64.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_012_775DDC.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_013_776054.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_014_7762CC.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_015_776544.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_017_777118.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_018_7771B8.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_019_777264.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_020_777308.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_021_7773B4.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_022_777468.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_023_777520.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_024_7775CC.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_025_777674.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_026_77771C.bin.lz \
  graphics/frontier_banim_aurabg3/frontier_banim_aurabg3_027_7777BC.bin.lz

