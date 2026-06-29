#include "global.h"

/* Migrated from asm/frontier_df4_voice.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_voice_000_1F578C[] __attribute__((section(".data.frontier_df4_voice.gap0a"))) = INCBIN_U8("data/sound/frontier_df4_voice_000_1F578C.bin", 0, 148);
u8 frontier_df4_voice_000a2_1F5840[] __attribute__((section(".data.frontier_df4_voice.gap0a2"))) = INCBIN_U8("data/sound/frontier_df4_voice_000_1F578C.bin", 180, 64);
u8 frontier_df4_voice_000b_1F5898[] __attribute__((section(".data.frontier_df4_voice.gap0b"))) = INCBIN_U8("data/sound/frontier_df4_voice_000_1F578C.bin", 268, 852);
u8 frontier_df4_voice_001_1F67BC[] __attribute__((section(".data.frontier_df4_voice.gap1"))) = INCBIN_U8("data/sound/frontier_df4_voice_001_1F67BC.bin");
u8 frontier_df4_voice_002_211988[] __attribute__((section(".data.frontier_df4_voice.gap2"))) = INCBIN_U8("data/sound/frontier_df4_voice_002_211988.bin");
/* gap3 (0x214120-0x216064 = gSongTable + dummy_song) is now built from editable
 * source: sound/song_table.s (the `song` macro array) + sound/songs/dummy_song.s.
 * The opaque INCBIN of data/sound/frontier_df4_voice_003_214120.bin is retired (D312). */
