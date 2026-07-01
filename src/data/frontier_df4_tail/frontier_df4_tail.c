#include "global.h"

/* Migrated from asm/frontier_df4_tail.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_tail_000_BABAF8[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = INCBIN_U8("graphics/frontier_df4_tail/frontier_df4_tail_000_BABAF8.bin");
u8 frontier_df4_tail_001_BB08B4[] __attribute__((section(".data.frontier_df4_tail.gap1"))) = INCBIN_U8("graphics/frontier_df4_tail/frontier_df4_tail_001a_BB08B4.4bpp.lz");
u8 data_08BB0B98[] __attribute__((section(".data.frontier_df4_tail.gap1"))) = INCBIN_U8("graphics/frontier_df4_tail/data_08BB0B98.4bpp");
/* data_08BB30F8: raw non-tile trailing remainder (20B), byte-exact. */
__asm__(
"\t.section .data.frontier_df4_tail.gap1, \"aw\", %progbits\n"
"\t.global data_08BB30F8\n"
"data_08BB30F8:\n"
"\t.byte 0xD6, 0x05, 0xEB, 0x00, 0x27, 0x01, 0x00, 0x00\n"
"\t.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00\n"
"\t.byte 0x00, 0x00, 0x00, 0x00\n"
);
