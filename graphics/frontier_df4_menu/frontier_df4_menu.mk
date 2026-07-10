# frontier_df4_menu -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

# PNG-extracted LZ sheet (proven byte-exact at -mindist 2). blob 001 is a 3-way split:
# [0:0x1218] 640t primary + preamble verbatim, [0x1218:0x15C8] 96t sheet -> editable PNG
# (png -> .4bpp -> .4bpp.lz), [0x15C8:end] raw blocks verbatim (INCBIN slices of the
# original .bin). gbagfx -mindist 2 reproduces the FE8 compressor's stream byte-for-byte.
graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.4bpp.lz: LZ_FLAGS := -mindist 2

# wave-reopened: 017/024/032/033 were mis-classified as non-reproducible LZ floors
# (an off-by-4-padding measurement error). Each starts with a GBA-BIOS-LZ77 4bpp sheet
# -> editable PNG whose png->.4bpp->.4bpp.lz at -mindist 2 reproduces the JP compressed
# bytes exactly. 017/024/033 keep a trailing raw block verbatim; 032's sheet is the whole
# symbol (its trailing block is the separate data_08AAB440 symbol). Sheet boundaries:
# 017 -> 0xFC0, 024 -> 0x3DC, 032 -> 0x7F4 (full), 033 -> 0x33C.
graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.4bpp.lz: LZ_FLAGS := -mindist 2
