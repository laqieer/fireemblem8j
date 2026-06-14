#include "global.h"

/* Migrated from asm/dat_menu_save_main_bg_p0.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_menu_save_main_bg_p0") u8 Img_SaveMenuBG[] = INCBIN_U8("graphics/misc_gfx2/Img_SaveMenuBG.bin.lz");
SECTION(".rodata.dat_menu_save_main_bg_p0") u16 Pal_SaveMenuBG[] = INCBIN_U16("graphics/misc_gfx2/Pal_SaveMenuBG.gbapal");
SECTION(".rodata.dat_menu_save_main_bg_p0") u8 Tsa_SaveMenuBG[] = INCBIN_U8("graphics/misc_gfx2/Tsa_SaveMenuBG.bin");
SECTION(".rodata.dat_menu_save_main_bg_p0") u8 Img_MainMenuBgFog[] = INCBIN_U8("graphics/misc_gfx2/Img_MainMenuBgFog.bin.lz");
SECTION(".rodata.dat_menu_save_main_bg_p0") u16 Pal_MainMenuBgFog[] = INCBIN_U16("graphics/misc_gfx2/Pal_MainMenuBgFog.gbapal");
