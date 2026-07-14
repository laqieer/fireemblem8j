#include "global.h"

/* Migrated from asm/dat_data_A01CC4_2.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 gGfx_UnkData_0[] __attribute__((section(".rodata.dat_data_A01CC4_2"), aligned(4))) = INCBIN_U8("graphics/misc_gfx2/gGfx_UnkData_0.4bpp.lz");
u8 gUnkData_47[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U8("graphics/reuse/gUnkData_47.4bpp.lz");
u8 gTsa_UnkData_0[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U8("graphics/misc_gfx2/gTsa_UnkData_0.tsa.bin");
/* issue143: gTsa_UnkData_0 was 276B (JP 0x08A7DCB8); the trailing 32B
 * [0xF4,0x114) is a standalone 16-color palette, not TSA data -- the TSA's
 * own header/entries end at 244B (242B 30x4 record + 2B alignment pad the TSA
 * owns). Split into the kept 244B gTsa_UnkData_0 above + this palette. No
 * consumer references this address: chapter_title.c's CallARM_FillTileRect
 * only ever reads gTsa_UnkData_0's own N*4 record bytes, never past them, so
 * this palette is dead/orphaned data -- kept byte-exact, not wired up. */
u16 Pal_ChapterTitleFire[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U16("graphics/misc_gfx2/Pal_ChapterTitleFire.gbapal");
u16 Img_GameOverText[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U16("graphics/misc_gfx2/Img_GameOverText.4bpp.lz");
u16 Pal_GameOverText2[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U16("graphics/misc_gfx2/Pal_GameOverText2.gbapal");
u16 Pal_GameOverText1[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U16("graphics/misc_gfx2/Pal_GameOverText1.gbapal");
u16 Tsa_GameOverFx[] __attribute__((section(".rodata.dat_data_A01CC4_2"))) = INCBIN_U16("graphics/misc_gfx2/Tsa_GameOverFx.bin");
