#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxHazymoonOBJ3[];

void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = 44;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 32 * 4 * CHR_SIZE);

    return;
}
