#include "global.h"
#include "bmunit.h"
#include "bmmap.h"
#include "proc.h"
#include "bm.h"
#include "sio.h"

void LABattleMap_ForecastMenu_Loop(struct SioProc85AA1AC * proc)
{
    if (proc->unk_64 != GetGameLock())
    {
        return;
    }

    if (gUnk_Sio_16.unk_06 == 0)
    {
        LinkArenaBattleMap_RestoreUnitItems(gActiveUnit);
        Proc_End(proc);
    }

    Proc_Break(proc);

    return;
}
