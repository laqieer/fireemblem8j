# frontier_df3_banim_mid -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df3_banim_mid.o: \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009a_6587E0.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009b_658880.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009c_658934.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009d_6589F0.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009e_658ACC.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009f_658BB4.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009g_658CD8.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009h_658DF8.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009i_658F04.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009j_659010.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009k_65910C.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009l_65920C.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009m_659308.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009n_659404.4bpp.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008a_657A78.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008b_657B20.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008c_657BDC.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008d_657CB4.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008e_657D94.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000a_64D2B4.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000b_64D3C8.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000c_64D478.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000d_64D580.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000e_64D6BC.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000f_64D830.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000g_64D9C8.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000h_64DB3C.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000i_64DC48.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000j_64DD1C.map.bin.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.4bpp.lz \
  graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_007_656EA8.gbapal



graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000a_64D2B4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000b_64D3C8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000c_64D478.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000d_64D580.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000e_64D6BC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000f_64D830.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000g_64D9C8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000h_64DB3C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000i_64DC48.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000j_64DD1C.map.bin.lz: LZ_FLAGS := -mindist 1

graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008a_657A78.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008b_657B20.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008c_657BDC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008d_657CB4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008e_657D94.map.bin.lz: LZ_FLAGS := -mindist 1

graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009a_6587E0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009b_658880.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009c_658934.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009d_6589F0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009e_658ACC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009f_658BB4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009g_658CD8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009h_658DF8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009i_658F04.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009j_659010.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009k_65910C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009l_65920C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009m_659308.map.bin.lz: LZ_FLAGS := -mindist 1