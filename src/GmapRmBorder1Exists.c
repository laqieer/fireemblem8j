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

//! FE8U = 0x080C2BC4
int GmapRmBorder1Exists(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        return Proc_Find(ProcScr_GmapRmBorder1) != NULL;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc->index == index)
        {
            return 1;
        }
    } while (proc != NULL);

    return 0;
}
