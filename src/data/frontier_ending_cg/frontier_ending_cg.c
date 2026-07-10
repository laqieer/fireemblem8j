#include "global.h"

/* frontier_ending_cg_000_B27970: a large UNCOMPRESSED CG blob (JP 0x08b27970,
 * 80484 B). Because it is uncompressed, any tile-aligned split is byte-exact.
 * Split into editable sources for the provably-clean leading region, keeping the
 * interspersed tiles/tilemap remainder verbatim (see graphics/frontier_ending_cg/
 * frontier_ending_cg.mk for the boundary proof):
 *   [0x00000:0x00080]  4x16 BGR555 palette  -> frontier_ending_cg.pal  (.gbapal)
 *   [0x00080:0x08080]  1024 clean 4bpp tiles -> frontier_ending_cg.png  (.4bpp)
 *   [0x08080:0x13a64]  interspersed tiles+tilemap (no clean tile-aligned cut)
 *                      -> frontier_ending_cg_tail_B2F9F0.bin (verbatim)
 * The three pieces concatenate to the exact original bytes; oracle: make compare.
 */

u8 frontier_ending_cg_000_B27970[] __attribute__((section(".data.frontier_ending_cg.gap0"))) = INCBIN_U8(
    "graphics/frontier_ending_cg/frontier_ending_cg.gbapal",
    "graphics/frontier_ending_cg/frontier_ending_cg.4bpp",
    "graphics/frontier_ending_cg/frontier_ending_cg_tail_B2F9F0.bin");
