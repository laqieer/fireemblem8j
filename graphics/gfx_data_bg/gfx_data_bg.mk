# gfx_data_bg -- region-DIFFERENT background graphics (JP 0x08926b14..0x089cd958),
# the largest graphics file. Per blob the asset TYPE is inferred from the BYTES:
# LZ77 tiles/tilemaps -> committed decompressed .bin rebuilt via gbagfx %.lz: %;
# raw 256-byte palettes -> committed JASC .pal rebuilt via %.gbapal: %.pal;
# other raw blobs (tilemaps) -> committed verbatim .bin, incbin'd directly. Extracted
# fresh from the JP ROM (region-different). Oracle: make compare.

asm/gfx_data_bg.o: \
  graphics/gfx_data_bg/gfx_data_bg_000_bg_House_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_002_bg_Caer_Pelyn_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_004_bg_Normal_Village_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_005_bg_Village_Clear_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_006_bg_Village_Clear_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_008_bg_Serafew_Village_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_009_bg_Port_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_010_bg_Ship_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_011_bg_Fireplace_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_013_bg_Fireplace_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_014_bg_Castle_Interior_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_016_bg_Grado_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_017_bg_Grado_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_019_bg_Throne_Normal_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_021_bg_Throne_Normal_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_023_bg_Castle_Bright_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_025_bg_Garden_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_027_bg_Manse_Back_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_029_bg_Cell_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_031_bg_Plain_1_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_032_bg_Plain_1_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_034_bg_Grass_Plains_2_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_036_bg_Plain_2_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_037_bg_Plain_2_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_038_bg_Plain_2_Night_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_039_bg_Stream_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_040_bg_Forest_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_041_bg_Town_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_042_bg_Castle_Back_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_043_bg_Interior_Black_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_044_bg_Passage_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_046_bg_Passage_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_047_bg_Burning_Castle_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_048_bg_Stone_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_049_bg_Stone_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_051_bg_Renais_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_053_bg_White_Chamber_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_055_bg_Desert_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_056_bg_Darkling_Woods_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_057_bg_Volcano_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_058_bg_Black_Temple_Outside_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_060_bg_Black_Temple_Inside_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_062_bg_Black_Temple_Inside_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_063_bg_Blank_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_064_bg_convo2_00_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_066_bg_convo2_00_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_067_bg_convo2_01_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_068_bg_convo2_02_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_069_bg_convo2_03_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_071_bg_convo2_04_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_072_bg_convo2_06_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_073_bg_convo2_07_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_074_bg_convo2_08_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_076_bg_convo2_09_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_078_bg_convo2_10_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_079_bg_convo2_11_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_080_bg_convo2_12_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_082_bg_convo2_13_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_084_bg_convo2_15_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_086_bg_convo2_16_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_088_bg_convo2_17_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_089_bg_convo2_18_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_090_bg_convo2_19_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_092_bg_convo2_20_palette.gbapal \
  graphics/gfx_data_bg/gfx_data_bg_093_bg_convo2_21_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_095_bg_convo2_22_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_097_bg_convo2_23_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_099_bg_convo2_24_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_101_bg_convo2_25_tiles.bin.lz \
  graphics/gfx_data_bg/gfx_data_bg_103_bg_convo2_25_palette.gbapal

