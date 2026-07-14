#include "global.h"

/* Migrated from asm/dat_worldmap_skirmish.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_skirmish") u8 Img_WorldMapPlaceDot[] = INCBIN_U8("graphics/misc_gfx2/Img_WorldMapPlaceDot.4bpp.lz");
SECTION(".rodata.dat_worldmap_skirmish") u16 Pal_WmPlaceDot_Highlight[] = INCBIN_U16("graphics/misc_gfx2/Pal_WmPlaceDot_Highlight.gbapal");
SECTION(".rodata.dat_worldmap_skirmish") u16 Pal_WmPlaceDot_Standard[] = INCBIN_U16("graphics/misc_gfx2/Pal_WmPlaceDot_Standard.gbapal");
SECTION(".rodata.dat_worldmap_skirmish") u8 gWorldmapSkirmish_0[] = INCBIN_U8("graphics/reuse/gWorldmapSkirmish_0.4bpp.lz");
/* issue #143: dat_worldmap_skirmish expanded FORWARD from 0x08B26A6C through
 * 0x08B2759C, absorbing the former frontier_df4_ending gap14 (2864 B). Ground
 * truth from real consumers (src/StartWorldMapMinimapCore.c, src/GMapRadar_0.c,
 * src/WmMinimap_BlinkPalette.c, src/GmTmConfront_StartAnim.c):
 *   Decompress(Img_WorldmapMinimap, VRAM); ApplyPalette(Pal_WorldmapMinimap, 7);
 *   CallARM_FillTileRect(gUnk_17, gWorldmapSkirmish_1, ...);
 *   pal[9] = gWorldmapSkirmish_2[colorIdx]; pal[7] = gWorldmapSkirmish_3[colorIdx];
 *   Decompress(gImg_WorldmapSkirmish, (void *)0x06013000);
 * The next object (dat_anim_worldmap_skirmish) already starts exactly at
 * 0x08B2759C with no gap, so no bytes are swallowed or moved.
 *
 *   [0x08B26A6C,0x08B2715C) 1776 B LZ77 -> 2048 B/64-tile sheet, baseline
 *     Img_WorldmapMinimap -> Img_WorldmapMinimap.png.
 *   [0x08B2715C,0x08B2717C) 32 B/16-color palette, baseline Pal_WorldmapMinimap
 *     -> Pal_WorldmapMinimap.pal.
 *   [0x08B2717C,0x08B27200) 132 B: standard TSA (hdr 0x07,0x07 => 8x8, 130 B)
 *     + 2-byte zero pad, baseline gWorldmapSkirmish_1 -> gWorldmapSkirmish_1.tsa.bin.
 *   [0x08B27200,0x08B27220) 32 B / [0x08B27220,0x08B27240) 32 B: time-domain
 *     BGR555 LUTs (NOT image palettes -- see WmMinimap_BlinkPalette.c indexing
 *     by colorIdx), baseline gWorldmapSkirmish_2 / gWorldmapSkirmish_3. Typed
 *     as literal u16[16] (not INCBIN) so no graphics/audit tool misclassifies
 *     them as a palette asset.
 *   [0x08B27240,0x08B2759C) 860 B LZ77 -> 4096 B/128-tile sheet, baseline
 *     gImg_WorldmapSkirmish -> gImg_WorldmapSkirmish.png.
 */
SECTION(".rodata.dat_worldmap_skirmish") u8 Img_WorldmapMinimap[] = INCBIN_U8("graphics/misc_gfx2/Img_WorldmapMinimap.4bpp.lz");
SECTION(".rodata.dat_worldmap_skirmish") u16 Pal_WorldmapMinimap[] = INCBIN_U16("graphics/misc_gfx2/Pal_WorldmapMinimap.gbapal");
SECTION(".rodata.dat_worldmap_skirmish") u8 gWorldmapSkirmish_1[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapSkirmish_1.tsa.bin");
SECTION(".rodata.dat_worldmap_skirmish") u16 gWorldmapSkirmish_2[16] = {
    0x7FFF, 0x7FBC, 0x7F78, 0x7B35, 0x7AF1, 0x7AAD, 0x766A, 0x7626,
    0x71E3, 0x7627, 0x768B, 0x7ACF, 0x7B13, 0x7F77, 0x7FBB, 0x7FFF,
};
SECTION(".rodata.dat_worldmap_skirmish") u16 gWorldmapSkirmish_3[16] = {
    0x7FFF, 0x73BF, 0x635F, 0x56FF, 0x469F, 0x363F, 0x29DF, 0x197F,
    0x0D1F, 0x1D7F, 0x2DFF, 0x3E5F, 0x4EBF, 0x5F3F, 0x6F9F, 0x7FFF,
};
SECTION(".rodata.dat_worldmap_skirmish") u8 gImg_WorldmapSkirmish[] = INCBIN_U8("graphics/misc_gfx2/gImg_WorldmapSkirmish.4bpp.lz");
