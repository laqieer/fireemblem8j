#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxShineOBJRND[];

void StartSubSpell_efxShineOBJRND(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxShineOBJRND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 2;
    proc->unk30 = 0;
    SpellFx_RegisterObjPal(Pal_ShineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_ShineSprites, 32 * 4 * CHR_SIZE);
    return;
}
