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

void NewEfxClasschgOBJGain(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    proc = Proc_Start(ProcScr_efxClasschgOBJGain, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, BanimScr_Ekrdragonfx_0, BanimScr_Ekrdragonfx_0, BanimScr_Ekrdragonfx_0, BanimScr_Ekrdragonfx_0);

    SpellFx_RegisterObjPal(Pal_Ekrdragonfx_1, 0x20);
    SpellFx_RegisterObjGfx(Img_Ekrdragonfx, 0x1000);
}
