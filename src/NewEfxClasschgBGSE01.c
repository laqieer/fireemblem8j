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
extern struct ProcCmd ProcScr_efxClasschgBGSE01[];

void NewEfxClasschgBGSE01(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}
