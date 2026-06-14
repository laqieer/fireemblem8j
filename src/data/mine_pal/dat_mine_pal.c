#include "global.h"

/* Migrated from asm/dat_mine_pal.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Pal_MineFx[] __attribute__((section(".rodata.dat_mine_pal"), aligned(4))) = INCBIN_U16("graphics/misc_gfx2/Pal_MineFx.gbapal");
u16 Pal_EventCursorShinning[] __attribute__((section(".rodata.dat_mine_pal"))) = INCBIN_U16("graphics/misc_gfx2/Pal_EventCursorShinning.gbapal");
