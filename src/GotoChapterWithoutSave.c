#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bmlib.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bm.h"

void GotoChapterWithoutSave(u16 chapterId)
{
    gPlaySt.chapterIndex = chapterId;

    Proc_Goto(Proc_Find(gProc_BMapMain), 2);
    Proc_EndEach(gProcScr_PlayerPhase);
    Proc_EndEach(gProcScr_CpPhase);
}
