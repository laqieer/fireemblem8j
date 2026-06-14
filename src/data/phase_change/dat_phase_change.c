#include "global.h"

/* Migrated from asm/dat_phase_change.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_phase_change") u8 Img_PhaseChangeUnk[] = INCBIN_U8("graphics/misc_gfx/Img_PhaseChangeUnk.bin.lz");
SECTION(".rodata.dat_phase_change") u8 Img_PhaseChangePlayer[] = INCBIN_U8("graphics/misc_gfx/Img_PhaseChangePlayer.bin.lz");
SECTION(".rodata.dat_phase_change") u16 Pal_PhaseChangePlayer[] = INCBIN_U16("graphics/misc_gfx/Pal_PhaseChangePlayer.gbapal");
SECTION(".rodata.dat_phase_change") u8 Img_PhaseChangeEnemy[] = INCBIN_U8("graphics/misc_gfx/Img_PhaseChangeEnemy.bin.lz");
SECTION(".rodata.dat_phase_change") u16 Pal_PhaseChangeEnemy[] = INCBIN_U16("graphics/misc_gfx/Pal_PhaseChangeEnemy.gbapal");
SECTION(".rodata.dat_phase_change") u8 Img_PhaseChangeOther[] = INCBIN_U8("graphics/misc_gfx/Img_PhaseChangeOther.bin.lz");
SECTION(".rodata.dat_phase_change") u16 Pal_PhaseChangeOther[] = INCBIN_U16("graphics/misc_gfx/Pal_PhaseChangeOther.gbapal");
SECTION(".rodata.dat_phase_change") u16 Pal_PhaseChange_0[] = INCBIN_U16("graphics/misc_gfx/Pal_PhaseChange_0.gbapal");
SECTION(".rodata.dat_phase_change") u8 Img_PhaseChangeSquares[] = INCBIN_U8("graphics/misc_gfx/Img_PhaseChangeSquares.bin.lz");
