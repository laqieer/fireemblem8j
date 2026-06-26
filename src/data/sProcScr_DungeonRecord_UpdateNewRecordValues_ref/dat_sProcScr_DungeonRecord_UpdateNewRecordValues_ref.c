#include "global.h"

/* De-pointered from data/residual/sProcScr_DungeonRecord_UpdateNewRecordValues.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_sProcScr_DungeonRecord_UpdateNewRecordValues_ref, \"a\", %progbits\n"
"\t.global sProcScr_DungeonRecord_UpdateNewRecordValues\n"
"sProcScr_DungeonRecord_UpdateNewRecordValues:\n"
"\t.4byte 0x00000002\n"
"\t.4byte DungeonRecordUi_ClearCountAnim_Init + 0x1\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte DungeonRecordUi_ClearCountClearText + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte DungeonRecordUi_ClearCountAnim_Loop + 0x1\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte DungeonRecordUi_EnemiesDefeatedTally_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte DungeonRecordUi_UpdateEnemiesDefeatedCount + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte DungeonRecordUi_StopTallySound + 0x1\n"
"\t.4byte 0x0028000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte gap_000396D8 + 0x1\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte DungeonRecordUi_UpdateLabelIfNewRecord + 0x1\n"
"\t.4byte 0x0019000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte DungeonRecordUi_GotoNextLabel + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
