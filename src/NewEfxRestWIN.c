#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void NewEfxRestWIN(struct Anim *anim, int unk44, void *unk54, void *unk58)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_EfxRestWIN, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk54 = unk54;
    proc->unk58 = unk58;

    if (GetAnimPosition(GetAnimAnotherSide(anim)) == EKR_POS_L)
        proc->unk32 = 0xFFB8;
    else
        proc->unk32 = 0xFFF8;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L)
            proc->unk32 += 0x18;
        else
            proc->unk32 -= 0x18;
    }
}
