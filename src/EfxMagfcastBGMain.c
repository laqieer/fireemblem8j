#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

void EfxMagfcastBGMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **tsa1;
        u16 **tsa2;

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
                BG_SetPosition(BG_1, 0x18, 0x0);
            else
                BG_SetPosition(BG_1, 0xE8, 0x0);
        }

        tsa1 = proc->tsal;
        tsa2 = proc->tsar;

        SpellFx_WriteBgMap(
            proc->anim,
            tsa1[ret],
            tsa2[ret]
        );

        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }
}
