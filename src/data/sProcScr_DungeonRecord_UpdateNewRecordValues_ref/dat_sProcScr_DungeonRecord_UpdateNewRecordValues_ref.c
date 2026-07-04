#include "global.h"
#include "proc.h"

extern void DungeonRecordUi_ClearCountAnim_Init(ProcPtr proc);
extern void DungeonRecordUi_ClearCountClearText(ProcPtr proc);
extern void DungeonRecordUi_ClearCountAnim_Loop(ProcPtr proc);
extern void DungeonRecordUi_EnemiesDefeatedTally_Init(ProcPtr proc);
extern void DungeonRecordUi_UpdateEnemiesDefeatedCount(ProcPtr proc);
extern void DungeonRecordUi_StopTallySound(ProcPtr proc);
/* gap_000396D8 is a residual-gap Thumb stub at 0x080396D8 (needs +1 for Thumb ptr) */
extern u8 gap_000396D8[];
extern void DungeonRecordUi_UpdateLabelIfNewRecord(ProcPtr proc);
extern void DungeonRecordUi_GotoNextLabel(ProcPtr proc);

struct ProcCmd sProcScr_DungeonRecord_UpdateNewRecordValues[] __attribute__((section(".rodata.dat_sProcScr_DungeonRecord_UpdateNewRecordValues_ref"))) = {
    PROC_CALL(DungeonRecordUi_ClearCountAnim_Init),
    PROC_SLEEP(1),
    PROC_REPEAT(DungeonRecordUi_ClearCountClearText),
    PROC_REPEAT(DungeonRecordUi_ClearCountAnim_Loop),
    PROC_SLEEP(0x1E),
    PROC_CALL(DungeonRecordUi_EnemiesDefeatedTally_Init),
    PROC_REPEAT(DungeonRecordUi_UpdateEnemiesDefeatedCount),
    PROC_REPEAT(DungeonRecordUi_StopTallySound),
    PROC_SLEEP(0x28),

PROC_LABEL(0),
    { 0x02, 0x0000, (const void*)((u8*)gap_000396D8 + 1) },

PROC_LABEL(1),
    PROC_CALL(DungeonRecordUi_UpdateLabelIfNewRecord),
    PROC_SLEEP(0x19),
    PROC_CALL(DungeonRecordUi_GotoNextLabel),
    PROC_END,
};
