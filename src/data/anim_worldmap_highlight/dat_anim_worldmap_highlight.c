#include "global.h"

/* Migrated from asm/dat_anim_worldmap_highlight.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u16 Pal_WmHighLightNationMap[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U16("graphics/misc_gfx3/Pal_WmHighLightNationMap.gbapal");
u16 Img_WmHightLightMapFrecia[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U16("graphics/misc_gfx3/Img_WmHightLightMapFrecia.bin.lz");
extern u16 Ap_WmHightLightMapFrecia[1] __attribute__((alias("Ap_WmHightLightMapFrecia_motion")));
u8 Ap_WmHightLightMapFrecia_motion[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_motion.bin");
u8 Ap_WmHightLightMapFrecia_frame_list[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_frame_list.bin");
u8 Ap_WmHightLightMapFrecia_anim_list[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_anim_list.bin");
u8 Ap_WmHightLightMapFrecia_frame_0[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_frame_0.bin");
u8 Ap_WmHightLightMapFrecia_frame_1[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_frame_1.bin");
u8 Ap_WmHightLightMapFrecia_anim_0[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_anim_0.bin");
u8 Ap_WmHightLightMapFrecia_anim_1[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMapFrecia_anim_1.bin");
u16 Img_WmHightLightMap2[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U16("graphics/misc_gfx3/Img_WmHightLightMap2.bin.lz");
extern u16 Ap_WmHightLightMap2[1] __attribute__((alias("Ap_WmHightLightMap2_motion")));
u8 Ap_WmHightLightMap2_motion[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_motion.bin");
u8 Ap_WmHightLightMap2_frame_list[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_frame_list.bin");
u8 Ap_WmHightLightMap2_anim_list[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_anim_list.bin");
u8 Ap_WmHightLightMap2_frame_0[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_frame_0.bin");
u8 Ap_WmHightLightMap2_frame_1[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_frame_1.bin");
u8 Ap_WmHightLightMap2_anim_0[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_anim_0.bin");
u8 Ap_WmHightLightMap2_anim_1[] __attribute__((section(".rodata.dat_anim_worldmap_highlight"))) = INCBIN_U8("data/residual/Ap_WmHightLightMap2_anim_1.bin");
