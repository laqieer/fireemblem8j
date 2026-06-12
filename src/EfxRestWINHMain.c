#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void EfxRestWINHMain(struct ProcEfx *proc)
{
    if (gBmSt.main_loop_ended != false) {
        if (proc->unk48 == 0x2) {
            if (gEkrBg2ScrollFlip == 1) {
                gEkrBg2ScrollFlip = 0;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable1;
            } else {
                gEkrBg2ScrollFlip = 1;
                gpBg2ScrollOffsetStart = gpBg2ScrollOffsetTable2;
            }
        }

        if (gEkrBg1ScrollFlip == 1) {
            gEkrBg1ScrollFlip = 0;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList1;
        } else {
            gEkrBg1ScrollFlip = 1;
            gpBg1ScrollOffsetStart = gpBg1ScrollOffsetList2;
        }
    }

    gpBg2ScrollOffset = gpBg2ScrollOffsetStart;
    gpBg1ScrollOffset = gpBg1ScrollOffsetStart;

    if (++proc->timer == proc->unk44) {
        gEfxBgSemaphore--;
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
    }
}
