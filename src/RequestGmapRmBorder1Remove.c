#include "global.h"
#include "proc.h"
#include "worldmap.h"

extern struct ProcCmd ProcScr_GmapRmBorder1[];

void RequestGmapRmBorder1Remove(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (index < 0)
        {
            proc->flag = 1;
        }
        else if (proc->index == index)
        {
            proc->flag = 1;
            return;
        }
    } while (proc != NULL);

    return;
}
