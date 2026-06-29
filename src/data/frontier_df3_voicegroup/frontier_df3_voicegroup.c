#include "global.h"

/* Migrated from asm/frontier_df3_voicegroup.s (region-different voicegroup
 * residue: the bytes BETWEEN the editable sound/voicegroups/*.s tables.
 * Byte-identical via INCBIN_U8; baserom.gba NOT in this chain (self-contained).
 */

u8 frontier_df3_voicegroup_000_1F70E8[] __attribute__((section(".data.frontier_df3_voicegroup.gap0"))) = INCBIN_U8("data/sound/frontier_df3_voicegroup_000_1F70E8.bin");
u8 frontier_df3_voicegroup_001_202C07[] __attribute__((section(".data.frontier_df3_voicegroup.gap1"))) = INCBIN_U8("data/sound/frontier_df3_voicegroup_001_202C07.bin");
