#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxStatusCHG[];

void NewEfxStatusCHG(struct Anim * anim)
{
    struct ProcEfxHpBar *proc;
    if (gEkrHpBarCount == 0) {
        gEkrHpBarCount = 1;
        proc = Proc_Start(ProcScr_efxStatusCHG, PROC_TREE_3);
        proc->timer = 0;
        proc->anim_this = anim;
    }
}
