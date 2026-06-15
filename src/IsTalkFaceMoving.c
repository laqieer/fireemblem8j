#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_TalkFaceMove[];

s8 IsTalkFaceMoving(void)
{
    if (Proc_Find(gProcScr_TalkFaceMove) != NULL)
    {
        return 1;
    }

    return 0;
}
