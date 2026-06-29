#include "global.h"

/* Migrated from asm/frontier_df3_voicegroup.s (region-different voicegroup
 * residue: the bytes BETWEEN the editable sound/voicegroups/*.s tables.
 * Byte-identical via INCBIN_U8; baserom.gba NOT in this chain (self-contained).
 */

u8 frontier_df3_voicegroup_000_1F70E8[] __attribute__((section(".data.frontier_df3_voicegroup.gap0"))) = INCBIN_U8("data/sound/frontier_df3_voicegroup_000_1F70E8.bin");
/* gap1 now holds only the 537-byte prefix residue (0x202C07-0x202E20): the
 * 3-byte-misaligned tail of the voicegroup035 region. The remainder of this
 * blob (0x202E20-0x2031D4) is voicegroup036, now built from the editable
 * sound/voicegroups/voicegroup036.s voice_* macro table (S2). */
u8 frontier_df3_voicegroup_001_202C07[] __attribute__((section(".data.frontier_df3_voicegroup.gap1"))) = INCBIN_U8("data/sound/frontier_df3_voicegroup_001_202C07.bin", 0, 537);
