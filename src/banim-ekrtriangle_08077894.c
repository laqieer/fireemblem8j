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
void NewEkrTriArmorKnightOBJ(struct Anim *anim, u32 etype1, u32 etype2, u32 ewtype1, u32 ewtype2);
void NewEkrTriArmorKnightOBJ2(struct Anim * anim, u32 pos, u32 etype, u32 ewtype);
void NewEfxTriangleQUAKE(struct Anim * anim, int duration);

void EkrTriArmorKnightMain(struct ProcEkrTriClass * proc)
{
    if (++proc->timer == 0x1)
    {
        NewEkrTriArmorKnightOBJ(proc->anim, proc->etype1, proc->etype2, proc->ewtype1, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x30)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 0, proc->etype1, proc->ewtype1);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x3C)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x4F)
    {
        NewEkrTriArmorKnightOBJ2(proc->anim, 1, proc->etype2, proc->ewtype2);
        PlaySFX(0x0E2, 0x100, proc->anim->xPosition, 0x1);
    }

    if (proc->timer == 0x5B)
        gEkrTriangleInvalid = true;

    if (proc->timer == 0x60)
    {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        NewEfxTriangleQUAKE(proc->anim, 0xA);
    }

    if (proc->timer == 0x78)
        Proc_Break(proc);
}
