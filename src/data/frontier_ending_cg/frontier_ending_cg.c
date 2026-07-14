#include "global.h"

/* frontier_ending_cg_000_B27970: a large UNCOMPRESSED CG blob (JP 0x08b27970,
 * 80484 B). Because it is uncompressed, ANY tile-aligned split is byte-exact.
 *
 * The 47588 B tail [blob 0x08080:0x13a64] (ROM 0x08b2f9f0..0x08b3b3d4) was
 * previously kept fully verbatim ("interspersed tiles+tilemap, no clean cut").
 * Re-derived: separating each TSA tilemap first makes the intervening pixel runs
 * fall on 32-B tile boundaries (the prior spans were measured INCLUDING the
 * trailing tilemap). It resolves into 3 tilemaps, 2 raw tile sheets, a partial
 * tile fragment, and a typed palette/LZ/AP tail. TSA maps are named .tsa.bin
 * (u16 tile-attrs, hdr = (w-1)|((h-1)<<8),
 * then w*h entries + a 0x0000 pad -- matches fe8u's 1204-B cg_N.tsa.bin); tile
 * sheets are editable .png (gbagfx png->4bpp reproduces the exact ROM bytes);
 * the sole raw remnant is a 24-byte partial 4bpp fragment.
 *
 *   [0x00000:0x00080] 4x16 BGR555 palette      -> frontier_ending_cg.gbapal
 *   [0x00080:0x08080] 1024 clean 4bpp tiles     -> frontier_ending_cg.png
 *   [0x08080:0x08884] 32x32 TSA (hdr 0x1f1f)    -> frontier_ending_cg_map0.tsa.bin
 *   [0x08884:0x0d964] 647 4bpp tiles            -> frontier_ending_cg_sheet1.png
 *   [0x0d964:0x0d97c] 24 B partial 4bpp fragment -> frontier_ending_cg_pad_B352D4.bin
 *   [0x0d97c:0x0de30] 30x20 TSA (hdr 0x131d)    -> frontier_ending_cg_map1.tsa.bin
 *   [0x0de30:0x131d0] 669 4bpp tiles            -> frontier_ending_cg_sheet2.png
 *   [0x131d0:0x13684] 30x20 TSA (hdr 0x131d)    -> frontier_ending_cg_map2.tsa.bin
 *   [0x13684:0x136a4] 16-color BGR555 palette   -> Pal_FrontierEndingCgTail_B3AFF4.pal
 *   [0x136a4:0x139c4] LZ77 128-tile image       -> Img_FrontierEndingCgTail_B3B014.png
 *   [0x139c4:0x13a64] AP sprite animation       -> anim_frontier_ending_cg_tail_B3B334.s
 *
 * The pieces concatenate to the exact original bytes; oracle: make compare.
 */

u8 frontier_ending_cg_000_B27970[] __attribute__((section(".data.frontier_ending_cg.gap0"))) = INCBIN_U8(
    "graphics/frontier_ending_cg/frontier_ending_cg.gbapal",
    "graphics/frontier_ending_cg/frontier_ending_cg.4bpp",
    "graphics/frontier_ending_cg/frontier_ending_cg_map0.tsa.bin",
    "graphics/frontier_ending_cg/frontier_ending_cg_sheet1.4bpp",
    "graphics/frontier_ending_cg/frontier_ending_cg_pad_B352D4.bin",
    "graphics/frontier_ending_cg/frontier_ending_cg_map1.tsa.bin",
    "graphics/frontier_ending_cg/frontier_ending_cg_sheet2.4bpp",
    "graphics/frontier_ending_cg/frontier_ending_cg_map2.tsa.bin");

SECTION(".data.frontier_ending_cg.tail_pal") u16 Pal_FrontierEndingCgTail_B3AFF4[16] =
    INCBIN_U16("graphics/frontier_ending_cg/Pal_FrontierEndingCgTail_B3AFF4.gbapal");

SECTION(".data.frontier_ending_cg.tail_img") u8 Img_FrontierEndingCgTail_B3B014[] =
    INCBIN_U8("graphics/frontier_ending_cg/Img_FrontierEndingCgTail_B3B014.4bpp.lz");
