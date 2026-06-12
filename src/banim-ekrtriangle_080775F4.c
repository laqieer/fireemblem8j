#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

extern EWRAM_OVERLAY(banim) int gEkrTriangleInvalid;

/* prototypes for same-file helpers called by this run */
void NewEkrTriPegasusKnightBG(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void NewEkrTriPegasusKnightOBJ(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);

void EkrTriPegasusKnightMain(struct ProcEkrTriClass * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 0xA)
        NewEkrTriPegasusKnightOBJ(proc->anim, EKR_POS_L, proc->etype1, proc->ewtype1);

    if (proc->timer == 0x1C)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x22)
    {
        NewEkrTriPegasusKnightBG(anim1, EKR_POS_L, proc->etype1, proc->ewtype1);
        NewEkrTriPegasusKnightOBJ(proc->anim, EKR_POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x33)
        NewEfxFlashBgWhite(anim1, 0x6);

    if (proc->timer == 0x39)
    {
        NewEkrTriPegasusKnightBG(anim1, EKR_POS_R, proc->etype2, proc->ewtype2);
        PlaySFX(0x268, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x43)
    {
        gEkrTriangleInvalid = true;
        Proc_Break(proc);
    }
}
