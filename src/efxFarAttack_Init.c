#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

void EfxFarAttack_SetAnimXPositions(struct ProcEfxFarAttack * unused, int x);

//! FE8U = 0x080534E4
void efxFarAttack_Init(struct ProcEfxFarAttack * proc)
{
    EfxFarAttack_SetAnimXPositions(proc, proc->unk_32);
    EkrDragonTmCpyExt(proc->unk_32, 0);
    EfxUpdateBg2Scroll(proc->unk_32);

    proc->timer = 0;

    Proc_Break(proc);

    return;
}
