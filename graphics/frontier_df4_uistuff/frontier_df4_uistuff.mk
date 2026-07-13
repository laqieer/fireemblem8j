# frontier_df4_uistuff -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.


# PNG-extracted LZ sheets (proven byte-exact at -mindist 2). Each image blob is an
# editable PNG (png -> .4bpp -> .4bpp.lz). The FE8 compressor's stream is
# reproduced byte-for-byte at gbagfx's -mindist 2 (default, pinned here for
# durability). Image lengths: 035 (Img_sub_8021AFC) -> 0x1014, 036
# (Img_Sub8022200) -> 0x3B8.
# 034 (wave-reopened): the whole 72t sheet is one PNG (no trailing block); it was
# previously the decompressed .bin re-compressed as .bin.lz, now png -> .4bpp.lz.
graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_uistuff/frontier_df4_uistuff_035_5CDF84.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_uistuff/frontier_df4_uistuff_036_5D14D4.4bpp.lz: LZ_FLAGS := -mindist 2

# #143: the former "tail" bin slices behind gap35/gap36 are now fully symbolized
# typed assets (see src/data/frontier_df4_uistuff/frontier_df4_uistuff.c). Each
# pair is a real consumer's palette + TSA:
#  - gap35 (src/sub_8021AFC.c): Pal_sub_8021AFC.pal -> .gbapal (32B/16-color, one
#    bank) and Tsa_sub_8021AFC.tsa.bin -> .tsa.bin.lz (committed decompressed,
#    1536B headerless screen-entry data; the LZ77 stream reproduces byte-exact at
#    gbagfx's DEFAULT flags -- no -mindist pin required/proven).
#  - gap36 (src/sub_8022200.c): Pal_Sub8022200.pal -> .gbapal (full 512B/256-color
#    bank -- 240 trailing zero colors are unread reserved banks but occupy ROM so
#    all 512 bytes are preserved verbatim) and Tsa_Sub8022200.tsa.bin ->
#    .tsa.bin.lz (committed decompressed, 1042B = 2-byte header 0x1319 + 26x20 TSA;
#    also reproduces byte-exact at gbagfx's default flags).

