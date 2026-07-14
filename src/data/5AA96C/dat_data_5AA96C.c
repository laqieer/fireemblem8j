#include "global.h"

/* Migrated from asm/dat_data_5AA96C.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_data_5AA96C") u16 gUnkData_21[] = INCBIN_U16("graphics/reuse/gUnkData_21.4bpp");
SECTION(".rodata.dat_data_5AA96C") u16 gUnkData_22[] = INCBIN_U16("graphics/reuse/gUnkData_22.4bpp");
SECTION(".rodata.dat_data_5AA96C") u16 gUnkData_23[] = INCBIN_U16("graphics/reuse/gUnkData_23.4bpp");
SECTION(".rodata.dat_data_5AA96C") u16 gUnkData_24[] = INCBIN_U16("graphics/reuse/gUnkData_24.4bpp");
SECTION(".rodata.dat_data_5AA96C") u8 Img_LinkArenaPostBattleBg[] = INCBIN_U8("graphics/misc_gfx2/Img_LinkArenaPostBattleBg.4bpp.lz");
SECTION(".rodata.dat_data_5AA96C") u16 Pal_LinkArenaPostBattleBg[] = INCBIN_U16("graphics/misc_gfx2/Pal_LinkArenaPostBattleBg.gbapal");
SECTION(".rodata.dat_data_5AA96C") u8 Tsa_LinkArenaPostBattleBg[] = INCBIN_U8("graphics/misc_gfx2/Tsa_LinkArenaPostBattleBg.bin.lz");
SECTION(".rodata.dat_data_5AA96C") u8 gUnkData_25[] = INCBIN_U8("graphics/reuse/gUnkData_25.4bpp.lz");

/* issue143 Recipe C: gUnkData_26.tsa.bin (21764B, JP 0x085DB10C..0x085E0610)
 * was one opaque monolithic multi-resource blob. It decomposes into 13
 * semantic MultiBoot-send / Link Arena assets, each independently verified
 * byte-exact (decompress->recompress / png->4bpp->lz / pal->gbapal cmp
 * against the original monolith bytes):
 *
 * sub_80487D8 (LATitleBanner_Init callee via SIO MultiBoot flow) decompresses
 * the BG image+tilemap+8-bank palette and the list-bar TSAs/palette/font
 * assets below; sub_8048FC0 decompresses the sprite-text image/palette.
 * sio_uiutils_0804D148.c's LATitleBanner_Init consumes only the leading
 * Tsa_LinkArenaTitleBanner record via CallARM_FillTileRect.
 */
SECTION(".rodata.dat_data_5AA96C") u8 Tsa_LinkArenaTitleBanner[] = INCBIN_U8("graphics/misc/Tsa_LinkArenaTitleBanner.bin");
SECTION(".rodata.dat_data_5AA96C") u8 Img_MultiBootSendBg[] = INCBIN_U8("graphics/misc/Img_MultiBootSendBg.4bpp.lz");
SECTION(".rodata.dat_data_5AA96C") u16 Tilemap_MultiBootSendBg[] = INCBIN_U16("graphics/misc/Tilemap_MultiBootSendBg_map.bin.lz");
SECTION(".rodata.dat_data_5AA96C") u16 Pal_MultiBootSendBg[] = INCBIN_U16("graphics/misc/Pal_MultiBootSendBg.gbapal");
SECTION(".rodata.dat_data_5AA96C") u8 Img_MultiBootSendListBar[] = INCBIN_U8("graphics/misc/Img_MultiBootSendListBar.4bpp.lz");
/* tile0x78/pal4 base (0x4078 passed to j_TmApplyTsa by sub_80487D8): narrow
 * (19x4) and wide (30x3) list-bar TSA variants, back-to-back. */
SECTION(".rodata.dat_data_5AA96C") u8 Tsa_MultiBootSendListBarNarrow[] = INCBIN_U8("graphics/misc/Tsa_MultiBootSendListBarNarrow.bin");
SECTION(".rodata.dat_data_5AA96C") u8 Tsa_MultiBootSendListBarWide[] = INCBIN_U8("graphics/misc/Tsa_MultiBootSendListBarWide.bin");
SECTION(".rodata.dat_data_5AA96C") u16 Pal_MultiBootSendListBar[] = INCBIN_U16("graphics/misc/Pal_MultiBootSendListBar.gbapal");
SECTION(".rodata.dat_data_5AA96C") u8 Img_MultiBootSendFont[] = INCBIN_U8("graphics/misc/Img_MultiBootSendFont.4bpp.lz");
SECTION(".rodata.dat_data_5AA96C") u16 Pal_MultiBootSendFont[] = INCBIN_U16("graphics/misc/Pal_MultiBootSendFont.gbapal");
SECTION(".rodata.dat_data_5AA96C") u8 Img_LinkArenaSpriteText[] = INCBIN_U8("graphics/misc/Img_LinkArenaSpriteText.4bpp.lz");
SECTION(".rodata.dat_data_5AA96C") u16 Pal_LinkArenaSpriteText[] = INCBIN_U16("graphics/misc/Pal_LinkArenaSpriteText.gbapal");
/* gUnk_LinkArenaSpriteTextTail: [+0x5478,+0x5504) 140B = u16[70]. No consumer
 * found (dead FLOOR) -- typed literal, not INCBIN (too small/irregular to
 * warrant a separate committed asset file). */
SECTION(".rodata.dat_data_5AA96C") u16 gUnk_LinkArenaSpriteTextTail[] = {
    0x0010, 0x0002, 0x0033, 0xF000, 0x9001, 0x1101, 0xF011, 0x9001, 0x3301, 0x2222, 0x01F0, 0x0190,
    0x3333, 0x01F0, 0x0190, 0x4433, 0xF044, 0x9001, 0x5501, 0xF055, 0x9001, 0x3301, 0x6666, 0x01F0,
    0x0190, 0x7777, 0x01F0, 0x0190, 0x8833, 0xF088, 0x9001, 0x9901, 0xF099, 0x9001, 0x3301, 0xAAAA,
    0x01F0, 0x0190, 0xBBBB, 0x01F0, 0x0190, 0xCC33, 0xF0CC, 0x9001, 0xDD01, 0xF0DD, 0x9001, 0x3301,
    0xEEEE, 0x01F0, 0x0190, 0xFFFF, 0x01F0, 0x0190, 0x0000, 0x0002, 0x0004, 0x0006, 0x0008, 0x000A,
    0x000C, 0x000E, 0x0010, 0x0012, 0x0014, 0x0016, 0x0018, 0x001A, 0x001C, 0x001F,
};
