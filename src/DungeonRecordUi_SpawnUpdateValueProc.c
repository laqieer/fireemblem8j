#include "global.h"
#include "proc.h"
#include "bmdifficulty.h"

extern struct ProcCmd sProcScr_DungeonRecord_UpdateValue[];

struct BMDifficultyProc* DungeonRecordUi_SpawnUpdateValueProc(int label, int value, ProcPtr parent) {
    struct BMDifficultyProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(sProcScr_DungeonRecord_UpdateValue, parent);
    } else {
        proc = Proc_Start(sProcScr_DungeonRecord_UpdateValue, PROC_TREE_3);
    }

    proc->labelIndex = label;
    proc->unk_30 = value;

    return proc;
}
