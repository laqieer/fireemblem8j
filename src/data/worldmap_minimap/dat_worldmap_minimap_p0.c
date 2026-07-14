#include "global.h"

/* Migrated from asm/dat_worldmap_minimap_p0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 *
 * issue #143: expanded BACKWARD from 0x08B1E49C to 0x08B1D954, absorbing the
 * former frontier_df4_ending gap9 (2888 B) and the gWorldmapMinimap_3..7 head
 * of former gap10 (192 B). Ground truth for gWorldmapMinimap_0..7 comes from
 * the real consumer src/WorldmapStatus_InitGfx.c:
 *   Decompress(gWorldmapMinimap_0, VRAM); ApplyPalettes(gWorldmapMinimap_7,6,3);
 *   Decompress(gWorldmapMinimap_1, buf); FillTileRect(..., gWorldmapMinimap_2..6, ...);
 * gWorldmapMinimap_8 onward (0x08B1E6BC+, DrawGMapPIPanelContents /
 * worldmap_player_interface) is a DIFFERENT consumer/scope and is intentionally
 * left as the (shrunk) frontier_df4_ending gap10 remainder -- out of this carve's
 * scope, not claimed done.
 *
 *   [0x08B1D954,0x08B1DDE4) 1168 B LZ77 -> 3072 B/96-tile sheet (unnamed;
 *     already had a PNG source pre-#143 as frontier_df4_ending_009_B1D954.png,
 *     moved here byte-identical) -> gUnk_08B1D954.png.
 *   [0x08B1DDE4,0x08B1DE04) 32 B/16-color palette (no proven name) ->
 *     gUnk_08B1DDE4.pal.
 *   [0x08B1DE04,0x08B1DEBC) 184 B standard TSA (hdr 0x0c,0x06 => 13x7) ->
 *     gUnk_08B1DE04.tsa.bin.
 *   [0x08B1DEBC,0x08B1DF18) 92 B standard TSA (hdr 0x0a,0x03 => 11x4, 90 B) +
 *     2-byte zero pad -> gUnk_08B1DEBC.tsa.bin.
 *   [0x08B1DF18,0x08B1E49C) 1412 B LZ77 -> 3424 B/107-tile sheet, baseline
 *     gWorldmapMinimap_0 -> gWorldmapMinimap_0.png (width=1 tile; 107 is prime
 *     so no rectangular width avoids padding tiles except 1xN).
 */

SECTION(".rodata.dat_worldmap_minimap_p0") u8 gUnk_08B1D954[] = INCBIN_U8("graphics/misc_gfx2/gUnk_08B1D954.4bpp.lz");
SECTION(".rodata.dat_worldmap_minimap_p0") u16 gUnk_08B1DDE4[] = INCBIN_U16("graphics/misc_gfx2/gUnk_08B1DDE4.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gUnk_08B1DE04[] = INCBIN_U8("graphics/misc_gfx2/gUnk_08B1DE04.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gUnk_08B1DEBC[] = INCBIN_U8("graphics/misc_gfx2/gUnk_08B1DEBC.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_0[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_0.4bpp.lz");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_1[] = INCBIN_U8("graphics/misc_gfx2/gTsa_WorldmapMinimap_1.bin.lz");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_2[] = INCBIN_U8("graphics/misc_gfx2/gTsa_WorldmapMinimap_2.bin");
/* gWorldmapMinimap_3..6: standard TSAs consumed via CallARM_FillTileRect (see
 * WorldmapStatus_InitGfx.c). gWorldmapMinimap_7: 3-bank/48-color palette
 * consumed via ApplyPalettes(gWorldmapMinimap_7, 6, 3). Former gap10 head
 * (0x08B1E5FC-0x08B1E6BC, 192 B); baseline aliases dropped, see
 * layout/baseline_syms_drop.d/issue-143-ending-assets.tsv.
 */
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_3[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_3.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_4[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_4.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_5[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_5.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u8 gWorldmapMinimap_6[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_6.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p0") u16 gWorldmapMinimap_7[] = INCBIN_U16("graphics/misc_gfx2/gWorldmapMinimap_7.gbapal");
