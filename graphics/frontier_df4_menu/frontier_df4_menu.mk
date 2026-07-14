# frontier_df4_menu -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

# PNG-extracted LZ sheet (proven byte-exact at -mindist 2). blob 001 is fully typed,
# no verbatim residual remains: [0:0xCE4] 640t head sheet -> editable PNG (_head.png ->
# .4bpp -> .4bpp.lz), [0xCE4:0x1198] standard TSA header 0x1D13=30x20 -> editable
# .tsa.bin (_head_tsa.tsa.bin, raw/uncompressed, no LZ), [0x1198:0x1218] 4 16-color
# palettes (_0 kept typed C u16[16] literal since 7 of 16 entries have bit15 set and a
# JASC round-trip would clear it; _1/_2/_3 exact JASC .pal), [0x1218:0x15C8] 96t sheet
# -> editable PNG (png -> .4bpp -> .4bpp.lz), [0x15C8:end] raw blocks verbatim (INCBIN
# slices of the tail TSA + palette). gbagfx -mindist 2 reproduces the FE8 compressor's
# stream byte-for-byte for both LZ sheets.
graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0_head.4bpp.lz: LZ_FLAGS := -mindist 2

# wave-reopened: 017/024/032/033 were mis-classified as non-reproducible LZ floors
# (an off-by-4-padding measurement error). Each starts with a GBA-BIOS-LZ77 4bpp sheet
# -> editable PNG whose png->.4bpp->.4bpp.lz at -mindist 2 reproduces the JP compressed
# bytes exactly. 017/024/033 keep a trailing raw block verbatim; 032's sheet is the whole
# symbol (its trailing region is now fully typed: Pal_SoundRoomUiElements + the
# UnusedMusicSelect* assets, issue #143). Sheet boundaries:
# 017 -> 0xFC0, 024 -> 0x3DC, 032 -> 0x7F4 (full), 033 -> 0x33C.
graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.4bpp.lz: LZ_FLAGS := -mindist 2

# blob 023 (A99FA8, 1660 B) multi-stream container, now fully typed: [0:0x40] 2
# palettes -> editable JASC (frontier_df4_menu_023_A99FA8_pal0/1.pal) +
# 3 self-delimiting LZ77 4bpp sub-streams -> editable PNG + [0x53C:0x67C] 6
# augury/rank-sprite palette frames (gPal_A9A4E4) + 4 fe8u-identical prep-window
# palettes (Pal_PrepWindowA/B/C/D), all editable JASC. _0 64t menu text, _1 14t UI
# bar, _2 64t icon sheet; -mindist 2 byte-exact.
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_0.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_1.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_2.4bpp.lz: LZ_FLAGS := -mindist 2

# blob 037 (AB7144) graphics prefix [0,0x5650] is a DECORATIVE FONT container, fully
# split into 93 editable PNGs: _00 = 320t Latin alphabet sheet, _01.._92 = 92 self-
# delimiting 16t class-name glyph sheets (Lord/Mercenary/Hero/Myrmidon... kanji), plus
# 4 16-color font palettes now editable JASC (Pal_MenuFontGlyphs0..3.pal, issue #143 --
# no verbatim .bin slice remains for them) and the shop/menu ProcScr tail [0x5650,end]
# typed in the .c (gDefaultShopInventory/gShopDialogueOffsetLut/gShopPortraitLut/
# gProcScr_ShopFadeIn/Out, own object src/bmshop_080B8CF0.c). All 93 sub-streams
# reproduce byte-exact at gbagfx's default -mindist 2, so (like blobs 022/031) they
# need no explicit LZ_FLAGS pin.
