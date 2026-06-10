#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ekrbattle.h"
#include "ekrlevelup.h"

void EfxleveluphbMain(ProcPtr proc)
{
    if (gBmSt.main_loop_ended != false)
    {
        if (gEkrBg2ScrollFlip == 1)
        {
            gEkrBg2ScrollFlip = 0;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
        }
        else
        {
            gEkrBg2ScrollFlip = 1;
            gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
        }

        if (gEkrBg1ScrollFlip == 1)
        {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        }
        else
        {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        }
    }
    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;
}
