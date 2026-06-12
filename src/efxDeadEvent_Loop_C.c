#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/songs.h"

void efxDeadEvent_Loop_C(struct ProcEfxDead *proc)
{
    if (CheckEkrWindowAppearUnexist() == true) {
        EnableEkrGauge();
        AsyncEkrDispUP();

        CpuFastFill(0, gBG0TilemapBuffer, 0x800);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        BG_SetPosition(BG_1, 0, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        EkrGauge_Set4C50();
        
        /* Maybe triger death event */
        DisplayDefeatTalkForPid(gEkrPids[GetAnimPosition(proc->anim1)]);
        Proc_Break(proc);
    }
}
