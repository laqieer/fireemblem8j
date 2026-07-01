#include "global.h"

/* Migrated from asm/frontier_df3_opanim_gfx.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df3_opanim_gfx_000_B75860[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap0"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_000a_B75860.4bpp.lz");
u8 data_08B75D88[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap0"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B75D88.4bpp.lz");
u8 data_08B760D0[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap0"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B760D0.4bpp");
/* data_08B77410: raw non-tile trailing remainder (12B), byte-exact. */
__asm__(
"\t.section .data.frontier_df3_opanim_gfx.gap0, \"aw\", %progbits\n"
"\t.global data_08B77410\n"
"data_08B77410:\n"
"\t.byte 0xF0, 0x01, 0xF0, 0x01, 0xF0, 0x01, 0xF0, 0x01\n"
"\t.byte 0x00, 0x00, 0x00, 0x00\n"
);
u8 frontier_df3_opanim_gfx_001_B79EBC[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap1"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_001_B79EBC.4bpp");
u8 frontier_df3_opanim_gfx_002_B7F118[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap2"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_002a_B7F118.4bpp.lz");
u8 data_08B7F71C[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap2"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B7F71C.4bpp.lz");
u8 data_08B7FA78[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap2"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B7FA78.4bpp");
/* data_08B839D8: raw non-tile trailing remainder (28B), byte-exact. */
__asm__(
"\t.section .data.frontier_df3_opanim_gfx.gap2, \"aw\", %progbits\n"
"\t.global data_08B839D8\n"
"data_08B839D8:\n"
"\t.byte 0x78, 0xF0, 0x71, 0x32, 0xBB, 0x12, 0xE7, 0x35\n"
"\t.byte 0xF4, 0xBF, 0xF0, 0x01, 0xF0, 0x01, 0xF8, 0xF0\n"
"\t.byte 0x01, 0xF0, 0x01, 0xF0, 0x01, 0xF0, 0x01, 0x20\n"
"\t.byte 0x01, 0x00, 0x00, 0x00\n"
);
u8 frontier_df3_opanim_gfx_003_B864A8[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap3"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/frontier_df3_opanim_gfx_003a_B864A8.4bpp.lz");
u8 data_08B86A6C[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap3"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B86A6C.4bpp.lz");
u8 data_08B86DB0[] __attribute__((section(".data.frontier_df3_opanim_gfx.gap3"))) = INCBIN_U8("graphics/frontier_df3_opanim_gfx/data_08B86DB0.4bpp");
/* data_08B89AF0: raw non-tile trailing remainder (8B), byte-exact. */
__asm__(
"\t.section .data.frontier_df3_opanim_gfx.gap3, \"aw\", %progbits\n"
"\t.global data_08B89AF0\n"
"data_08B89AF0:\n"
"\t.byte 0xF0, 0x01, 0xF0, 0x01, 0x00, 0x00, 0x00, 0x00\n"
);
