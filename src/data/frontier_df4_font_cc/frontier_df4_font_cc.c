#include "global.h"

/* Migrated from asm/frontier_df4_font_cc.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D311 editable music: gap0..gap5 were song001/song002 internal bytes mislabeled as
 * font_cc residue; they are now reproduced by the mid2agb song objects, so they are
 * removed here (un-tiled). gap6 was SPLIT: its first 0x112 bytes (0x53763A..0x53774C)
 * belonged to song002's tail and are now in song002.o; only its non-song remainder
 * (0x53774C..0x537960, 0x214 bytes) stays here. */
u8 frontier_df4_font_cc_078_56CAD8[] __attribute__((section(".data.frontier_df4_font_cc.gap78"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_078_56CAD8.bin");
u8 frontier_df4_font_cc_090_574344[] __attribute__((section(".data.frontier_df4_font_cc.gap90"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_090_574344.bin");
