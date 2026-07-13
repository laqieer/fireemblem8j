# frontier_df4_uistuff -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.


# PNG-extracted LZ sheets (proven byte-exact at -mindist 2). The first LZ77 sheet of
# each blob is now an editable PNG (png -> .4bpp -> .4bpp.lz); the trailing palette +
# bytes stay verbatim (INCBIN slice of the original .bin at the sheet boundary). The
# FE8 compressor's stream is reproduced byte-for-byte at gbagfx's -mindist 2 (default,
# pinned here for durability). Sheet boundaries: 035 -> 0x1014, 036 -> 0x3B8.
# 034 (wave-reopened): the whole 72t sheet is one PNG (no trailing block); it was
# previously the decompressed .bin re-compressed as .bin.lz, now png -> .4bpp.lz.
graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_uistuff/frontier_df4_uistuff_035_5CDF84.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_uistuff/frontier_df4_uistuff_036_5D14D4.4bpp.lz: LZ_FLAGS := -mindist 2

