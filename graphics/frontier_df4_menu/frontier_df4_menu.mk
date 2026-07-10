# frontier_df4_menu -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

# PNG-extracted LZ sheet (proven byte-exact at -mindist 2). blob 001 is a 3-way split:
# [0:0x1218] 640t primary + preamble verbatim, [0x1218:0x15C8] 96t sheet -> editable PNG
# (png -> .4bpp -> .4bpp.lz), [0x15C8:end] raw blocks verbatim (INCBIN slices of the
# original .bin). gbagfx -mindist 2 reproduces the FE8 compressor's stream byte-for-byte.
graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.4bpp.lz: LZ_FLAGS := -mindist 2
