#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxLunaOBJ[];

void StartSubSpell_efxLunaOBJ(struct Anim * anim)
{
    u32 i;
    for (i = 0; i < 8; i++)
    {
        struct ProcEfxOBJ * proc = Proc_Start(ProcScr_efxLunaOBJ, PROC_TREE_3);
        proc->anim = anim;
        proc->unk44 = i;
    }
    SpellFx_RegisterObjPal(Pal_LunaSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_LunaSprites, 32 * 4 * CHR_SIZE);
    return;
}
