#include "global.h"

/* JP operation subtitle graphics (region-different).
 * Migrated from asm/dat_gGfx_OpSubtitle_00..06_ref.s and
 * asm/dat_gTsa_OpSubtitle_00..05_ref.s.
 * Each symbol is placed in its own named rodata section to match the linker script.
 * Type matches extern declaration: u8 CONST_DATA (= u8 __attribute__((section(".data")))).
 * The per-variable section attribute below overrides the CONST_DATA section.
 */

SECTION(".rodata.dat_gGfx_OpSubtitle_00_ref") u8 gGfx_OpSubtitle_00[] = INCBIN_U8("graphics/misc_gfx3/gGfx_OpSubtitle_00.bin.lz");
SECTION(".rodata.dat_gGfx_OpSubtitle_01_ref") u8 gGfx_OpSubtitle_01[] = INCBIN_U8("graphics/misc_gfx3/gGfx_OpSubtitle_01.bin.lz");
SECTION(".rodata.dat_gGfx_OpSubtitle_02_ref") u8 gGfx_OpSubtitle_02[] = INCBIN_U8("graphics/misc_gfx2/gGfx_OpSubtitle_02.bin.lz");
SECTION(".rodata.dat_gGfx_OpSubtitle_03_ref") u8 gGfx_OpSubtitle_03[] = INCBIN_U8("graphics/misc_gfx2/gGfx_OpSubtitle_03.bin.lz");
SECTION(".rodata.dat_gGfx_OpSubtitle_04_ref") u8 gGfx_OpSubtitle_04[] = INCBIN_U8("graphics/misc_gfx2/gGfx_OpSubtitle_04.bin.lz");
SECTION(".rodata.dat_gGfx_OpSubtitle_05_ref") u8 gGfx_OpSubtitle_05[] = INCBIN_U8("data/residual/gGfx_OpSubtitle_05.bin");
SECTION(".rodata.dat_gGfx_OpSubtitle_06_ref") u8 gGfx_OpSubtitle_06[] = INCBIN_U8("graphics/misc_gfx2/gGfx_OpSubtitle_06.bin.lz");
SECTION(".rodata.dat_gTsa_OpSubtitle_00_ref") u8 gTsa_OpSubtitle_00[] = INCBIN_U8("data/residual/gTsa_OpSubtitle_00.bin");
SECTION(".rodata.dat_gTsa_OpSubtitle_01_ref") u8 gTsa_OpSubtitle_01[] = INCBIN_U8("data/residual/gTsa_OpSubtitle_01.bin");
SECTION(".rodata.dat_gTsa_OpSubtitle_03_ref") u8 gTsa_OpSubtitle_03[] = INCBIN_U8("data/residual/gTsa_OpSubtitle_03.bin");
SECTION(".rodata.dat_gTsa_OpSubtitle_04_ref") u8 gTsa_OpSubtitle_04[] = INCBIN_U8("data/residual/gTsa_OpSubtitle_04.bin");
SECTION(".rodata.dat_gTsa_OpSubtitle_05_ref") u8 gTsa_OpSubtitle_05[] = INCBIN_U8("data/residual/gTsa_OpSubtitle_05.bin");
