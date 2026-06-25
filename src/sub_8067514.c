#include "global.h"
#include "proc.h"
#include "anime.h"
#include "efxmagic.h"
#include "ekrbattle.h"

extern u32 gEfxBgSemaphore;

extern const struct ProcCmd gUnk_08601B48[];
extern const u32 * const gUnk_08601B30[];

void sub_8067514(struct Anim * anim, int x, int y, int scrId, int oam2)
{
    struct ProcEfxMagicOBJ * proc;
    struct Anim * frontAnim;
    const u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnk_08601B48, (ProcPtr)3);
    proc->anim = anim;

    scr = gUnk_08601B30[scrId];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;
    frontAnim->oam2Base = (frontAnim->oam2Base & 0xF3FF) | oam2;
}
