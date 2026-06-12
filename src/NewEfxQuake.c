#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"
/* TU-private data externs bound at their JP addresses */
extern const s16 gEfxbattle_0[];
extern const s16 gEfxbattle_1[];
extern const s16 gEfxbattle_2[];
extern const s16 gEfxbattle_3[];
extern const s16 gEfxbattle_4[];

ProcPtr NewEfxQuake(int kind)
{
    struct ProcEfxQuake * proc;

    if (gEfxFarAttackExist == 1)
    {
        return NULL;
    }

    gEfxQuakeExist = 1;
    proc = Proc_Start(ProcScr_efxQuake, PROC_TREE_3);

    proc->timer = 0;

    proc->anim_l = gAnims[0];
    proc->anim_r = gAnims[2];

    switch (kind) {
    case 0:
        proc->vec = gEfxbattle_0;
        proc->quake_ui = 0;

        break;

    case 1:
        proc->vec = gEfxQuakeVecs;
        proc->quake_ui = 0;

        break;

    case 2:
        proc->vec = gEfxbattle_1;
        proc->quake_ui = 0;

        break;

    case 3:
        proc->vec = gEfxQuakeVecs2;
        proc->quake_ui = 0;

        break;

    case 4:
        proc->vec = gEfxbattle_2;
        proc->quake_ui = 0;

        break;

    case 5:
        proc->vec = gEfxbattle_3;
        proc->quake_ui = 1;

        break;

    case 6:
        proc->vec = gEfxbattle_4;
        proc->quake_ui = 1;

        break;

    default:
        proc->vec = gEfxbattle_0;
        proc->quake_ui = 0;

        break;
    }

    proc->ix = 0;
    proc->iy = 0;

    return proc;
}
