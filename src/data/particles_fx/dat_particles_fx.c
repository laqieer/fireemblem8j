#include "global.h"

/* Migrated from asm/dat_particles_fx.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

const u16 gParticlesFx_3[] __attribute__((section(".rodata.dat_particles_fx"), aligned(4))) = INCBIN_U16("graphics/reuse/gParticlesFx_3.4bpp");
const u8 gParticlesFx_4[] __attribute__((section(".rodata.dat_particles_fx"))) = INCBIN_U8("data/residual/gParticlesFx_4.bin");
const u16 gParticlesFx_5[] __attribute__((section(".rodata.dat_particles_fx"))) = INCBIN_U16("graphics/reuse/gParticlesFx_5.4bpp");
u16 Img_LightRune[] __attribute__((section(".rodata.dat_particles_fx"))) = INCBIN_U16("graphics/misc_gfx2/Img_LightRune.bin.lz");
u16 Pal_LightRune[] __attribute__((section(".rodata.dat_particles_fx"))) = INCBIN_U16("graphics/misc_gfx2/Pal_LightRune.gbapal");
u16 Tsa_LightRune[] __attribute__((section(".rodata.dat_particles_fx"))) = INCBIN_U16("graphics/misc_gfx2/Tsa_LightRune.bin.lz");
