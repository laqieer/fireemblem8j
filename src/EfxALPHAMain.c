#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

//! FE8U = 0x0805BA64
void EfxALPHAMain(struct ProcEfxALPHA * proc)
{
    int bldA;
    int bldB;

    proc->timer++;

    if (proc->timer < proc->unk2E)
    {
        return;
    }

    bldA = Interpolate(INTERPOLATE_LINEAR, proc->unk44, proc->unk48, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));

    switch (proc->unk4C)
    {
        case 0:
            SetBlendAlpha(bldA, 16);
            break;

        case 1:
            SetBlendBrighten(bldA);
            break;

        case 2:
            bldB = Interpolate(INTERPOLATE_LINEAR, 8, 16, (proc->timer - proc->unk2E), (proc->unk30 - proc->unk2E));
            SetBlendAlpha(bldA, bldB);
            break;
    }

    if (proc->timer >= proc->unk30)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
