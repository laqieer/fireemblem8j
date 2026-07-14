#include "global.h"

/* dat_worldmap_minimap_p1: fills the naming/address gap between
 * dat_worldmap_minimap_p0 (ends 0x08B1E6BC) and dat_worldmap_minimap_p2
 * (starts 0x08B1E894) exactly -- issue #143 follow-up completing the
 * frontier_df4_ending_010 remainder (472 B, previously kept raw/UNCERTAIN).
 *
 * Ground truth from the real consumers:
 *   src/worldmap_player_interface.c:ApplyGMapPIMinimapUnitPalette() ->
 *     src = gWorldmapMinimap_8/9/10/11 (per FACTION_BLUE/RED/GREEN/other),
 *     then ApplyPalette(src, palId) -- each a 16-color palette (32 B).
 *   src/DrawGMapPIPanelContents.c -> CallARM_FillTileRect(gUnk_25,
 *     gWorldmapMinimap_12/13, 0x8000) per proc->interfaceKind (0 / 1) --
 *     each a standard TSA + 2-byte zero pad.
 *
 *   [0x08B1E6BC,0x08B1E6DC) 32 B/16-color palette, gWorldmapMinimap_8
 *     (FACTION_BLUE) -> gWorldmapMinimap_8.pal.
 *   [0x08B1E6DC,0x08B1E6FC) 32 B/16-color palette, gWorldmapMinimap_9
 *     (FACTION_RED) -> gWorldmapMinimap_9.pal.
 *   [0x08B1E6FC,0x08B1E71C) 32 B/16-color palette, gWorldmapMinimap_10
 *     (FACTION_GREEN) -> gWorldmapMinimap_10.pal.
 *   [0x08B1E71C,0x08B1E73C) 32 B/16-color palette, gWorldmapMinimap_11
 *     (default/other faction) -> gWorldmapMinimap_11.pal.
 *   [0x08B1E73C,0x08B1E7B8) 124 B: standard TSA (hdr 0x0b,0x04 => 12x5,
 *     122 B) + 2-byte zero pad, gWorldmapMinimap_12 ->
 *     gWorldmapMinimap_12.tsa.bin.
 *   [0x08B1E7B8,0x08B1E894) 220 B: standard TSA (hdr 0x0b,0x08 => 12x9,
 *     218 B) + 2-byte zero pad, gWorldmapMinimap_13 ->
 *     gWorldmapMinimap_13.tsa.bin.
 *
 * All six baseline_syms ABS aliases replaced by these real definitions; see
 * layout/baseline_syms_drop.d/issue-143-ending-assets.tsv.
 */

SECTION(".rodata.dat_worldmap_minimap_p1") u16 gWorldmapMinimap_8[] = INCBIN_U16("graphics/misc_gfx2/gWorldmapMinimap_8.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p1") u16 gWorldmapMinimap_9[] = INCBIN_U16("graphics/misc_gfx2/gWorldmapMinimap_9.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p1") u16 gWorldmapMinimap_10[] = INCBIN_U16("graphics/misc_gfx2/gWorldmapMinimap_10.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p1") u16 gWorldmapMinimap_11[] = INCBIN_U16("graphics/misc_gfx2/gWorldmapMinimap_11.gbapal");
SECTION(".rodata.dat_worldmap_minimap_p1") u8 gWorldmapMinimap_12[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_12.tsa.bin");
SECTION(".rodata.dat_worldmap_minimap_p1") u8 gWorldmapMinimap_13[] = INCBIN_U8("graphics/misc_gfx2/gWorldmapMinimap_13.tsa.bin");
