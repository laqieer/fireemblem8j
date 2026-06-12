#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WmPlaceDot[];

//! FE8U = 0x080C30E0
void SetWmPlaceDotFlagForIndex(int index)
{
    struct ProcWmPlaceDot * proc;
    struct ProcFindIterator procIter;

    Proc_FindBegin(&procIter, ProcScr_WmPlaceDot);
    do
    {
        proc = Proc_FindNext(&procIter);
        if (index < 0)
        {
            proc->flag = 1;
        }
        else if (proc->unk_2b == index)
        {
            proc->flag = 1;
            return;
        }
    } while (proc != NULL);

    return;
}
