#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

extern EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg;

void NewEfxClasschgOBJDiffusion(struct Anim * anim, u8 pos)
{
    struct ProcEfxOBJ * proc;
    proc = Proc_Start(ProcScr_efxClasschgOBJDiffusion, PROC_TREE_3);

    if (pos == EKR_POS_L)
        proc->anim = anim;
    else
        proc->anim = GetAnimAnotherSide(anim);

{
    u32 * scr = BanimScr_Ekrdragonfx_2;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
}

    SpellFx_RegisterObjPal(Pal_Ekrdragonfx_1, 0x20);
    SpellFx_RegisterObjGfx(Img_Ekrdragonfx, 0x1000);
}
