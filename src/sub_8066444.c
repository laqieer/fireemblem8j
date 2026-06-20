#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
void sub_8066444(struct Anim * anim) {
    void * q;
    struct Anim * frontAnim;
    const u32 * scr;
    gEfxBgSemaphore += 1;
    q = Proc_Start((const struct ProcCmd *)0x086017C0, (ProcPtr)3);
    *(struct Anim **)((char *)q + 0x5c) = anim;
    GetAnimAnotherSide(anim);
    scr = (const u32 *)0x085FF1C0;
    frontAnim = EfxCreateFrontAnim(*(struct Anim **)((char *)q + 0x5c), scr, scr, scr, scr);
    *(struct Anim **)((char *)q + 0x60) = frontAnim;
    frontAnim->oam2Base = (frontAnim->oam2Base & 0xF3FF) | 0x400;
    SpellFx_RegisterObjPal((const u16 *)0x0876361C, 0x20);
    SpellFx_RegisterObjGfx((const u16 *)0x08763310, 0x1000);
}
