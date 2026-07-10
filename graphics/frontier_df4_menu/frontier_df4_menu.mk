# frontier_df4_menu -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

# PNG-extracted LZ sheet (proven byte-exact at -mindist 2). blob 001 is a 3-way split:
# [0:0x1218] 640t primary + preamble verbatim, [0x1218:0x15C8] 96t sheet -> editable PNG
# (png -> .4bpp -> .4bpp.lz), [0x15C8:end] raw blocks verbatim (INCBIN slices of the
# original .bin). gbagfx -mindist 2 reproduces the FE8 compressor's stream byte-for-byte.
graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.4bpp.lz: LZ_FLAGS := -mindist 2

# blob 023 (A99FA8, 1660 B) multi-stream container: [0:0x40] 2 palettes verbatim +
# 3 self-delimiting LZ77 4bpp sub-streams -> editable PNG + [0x53C:end] 0x140 raw
# verbatim. _0 64t menu text, _1 14t UI bar, _2 64t icon sheet; -mindist 2 byte-exact.
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_0.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_1.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_2.4bpp.lz: LZ_FLAGS := -mindist 2

# blob 037 (AB7144) graphics prefix [0,0x5650] is a DECORATIVE FONT container, fully
# split into 93 editable PNGs: _00 = 320t Latin alphabet sheet, _01.._92 = 92 self-
# delimiting 16t class-name glyph sheets (Lord/Mercenary/Hero/Myrmidon... kanji), with
# the 4 palettes + 0x2C pre-ProcScr raw kept as verbatim .bin slices and the shop/menu
# ProcScr tail [0x5650,end] typed in the .c. All 93 sub-streams reproduce byte-exact at
# gbagfx's default -mindist 2, so (like blobs 022/031) they need no explicit LZ_FLAGS pin.
