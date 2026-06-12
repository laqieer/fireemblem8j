#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkGradoOBJ01[];

// clang-format on

//! FE8U = 0x08069AC4
void StartSubSpell_efxDarkGradoOBJ01(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    proc = Proc_Start(ProcScr_efxDarkGradoOBJ01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    SpellFx_RegisterObjPal(Pal_GleipnirSprites_Rocks, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_GleipnirSprites_Rocks, 32 * 4 * CHR_SIZE);

    return;
}
