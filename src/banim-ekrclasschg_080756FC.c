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

void NewEfxClasschgCLONE(struct Anim * anim, int duration)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
}
