#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"




void NewEfxMagdhisEffect(struct Anim *anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxMagdhisEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}
