#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p751.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p751") const u16 gLegacyUiFrameDPalette[] = INCBIN_U16("data/residual/gLegacyUiFrameDPalette.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p751") const u16 gUiBarPaletteD[] = INCBIN_U16("data/residual/gUiBarPaletteD.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p751") const u8 gUnkUiFrameImage[] = INCBIN_U8("data/residual/gUnkUiFrameImage.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p751") const u16 gUnkUiFramePalettes[] = INCBIN_U16("data/residual/gUnkUiFramePalettes.bin");
SECTION(".rodata.dat_worldmap_gmapunit_p751") u8 Img_SysGrayBox[] = INCBIN_U8("graphics/gmapunit/Img_SysGrayBox.bin.lz");
