#include "global.h"

/* Migrated from asm/frontier_df4_font_cc.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* D311 editable music: gap0..gap5 were song001/song002 internal bytes mislabeled as
 * font_cc residue; they are now reproduced by the mid2agb song objects, so they are
 * removed here (un-tiled). gap6 was SPLIT: its first 0x112 bytes (0x53763A..0x53774C)
 * belonged to song002's tail and are now in song002.o; only its non-song remainder
 * (0x53774C..0x537960, 0x214 bytes) stays here. */
u8 frontier_df4_font_cc_006_53774C[] __attribute__((section(".data.frontier_df4_font_cc.gap6"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_006_53774C.bin");
u8 frontier_df4_font_cc_010_53AF68[] __attribute__((section(".data.frontier_df4_font_cc.gap10"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_010_53AF68.bin");
u8 frontier_df4_font_cc_051_55A8BB[] __attribute__((section(".data.frontier_df4_font_cc.gap51"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_051_55A8BB.bin");
u8 frontier_df4_font_cc_052_55B4ED[] __attribute__((section(".data.frontier_df4_font_cc.gap52"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_052_55B4ED.bin");
u8 frontier_df4_font_cc_053_55B966[] __attribute__((section(".data.frontier_df4_font_cc.gap53"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_053_55B966.bin");
u8 frontier_df4_font_cc_054_55C3BA[] __attribute__((section(".data.frontier_df4_font_cc.gap54"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_054_55C3BA.bin");
u8 frontier_df4_font_cc_055_55C8E5[] __attribute__((section(".data.frontier_df4_font_cc.gap55"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_055_55C8E5.bin");
u8 frontier_df4_font_cc_060_56127F[] __attribute__((section(".data.frontier_df4_font_cc.gap60"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_060_56127F.bin");
u8 frontier_df4_font_cc_067_566624[] __attribute__((section(".data.frontier_df4_font_cc.gap67"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_067_566624.bin");
u8 frontier_df4_font_cc_068_566C80[] __attribute__((section(".data.frontier_df4_font_cc.gap68"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_068_566C80.bin");
u8 frontier_df4_font_cc_071_567C29[] __attribute__((section(".data.frontier_df4_font_cc.gap71"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_071_567C29.bin");
u8 frontier_df4_font_cc_079_56CF54[] __attribute__((section(".data.frontier_df4_font_cc.gap79"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_079_56CF54.bin");
u8 frontier_df4_font_cc_081_56E174[] __attribute__((section(".data.frontier_df4_font_cc.gap81"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_081_56E174.bin");
u8 frontier_df4_font_cc_082_56E70C[] __attribute__((section(".data.frontier_df4_font_cc.gap82"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_082_56E70C.bin");
u8 frontier_df4_font_cc_083_56EB28[] __attribute__((section(".data.frontier_df4_font_cc.gap83"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_083_56EB28.bin");
u8 frontier_df4_font_cc_084_56EF80[] __attribute__((section(".data.frontier_df4_font_cc.gap84"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_084_56EF80.bin");
u8 frontier_df4_font_cc_088_573134[] __attribute__((section(".data.frontier_df4_font_cc.gap88"))) = INCBIN_U8("graphics/frontier_df4_font_cc/frontier_df4_font_cc_088_573134.bin");
