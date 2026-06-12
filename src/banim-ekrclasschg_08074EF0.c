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

void NewEkrClassChg(struct Anim * anim)
{
    NewEfxSpellCast();
    gpProcEkrClasschg = Proc_Start(ProcScr_ekrClasschg, PROC_TREE_3);
    gpProcEkrClasschg->anim = anim;
    gpProcEkrClasschg->timer = 0;
    gpProcEkrClasschg->done = false;
}
