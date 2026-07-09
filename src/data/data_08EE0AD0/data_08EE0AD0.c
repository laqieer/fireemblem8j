#include "global.h"

/* All-zero NULL tail of battle_terrain_table at 0x08EE0AD0 (304 B = 76 u32
 * words). Byte-neutral migration from the raw INCBIN of
 * data/residual/data_08EE0AD0.bin to a typed zero array. make compare is the oracle. */

const u32 BattleTerrainTable_NullTail_08EE0AD0[76] __attribute__((section(".data.residue.08EE0AD0"))) = {0};
