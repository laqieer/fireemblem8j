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

void EfxDeadDragonAlphaMain(struct ProcEfxDead *proc)
{
    if (++proc->timer > 0x3C) {
        EfxTmFill(0);
        BG_Fill(gBG3TilemapBuffer, 0xF000);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        SetDefaultColorEffects();
        Proc_Break(proc);
        return;
    }
        
    SetBlendConfig(
        1,
        Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x3C),
        0x10, 0
    );
}
