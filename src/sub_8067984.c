#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
struct Anim *EfxCreateFrontAnim(struct Anim *, const u32 *, const u32 *, const u32 *, const u32 *);
void sub_8067984(void *anim) {
    void *q; struct Anim *e;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)0x08601CA0, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    e = EfxCreateFrontAnim((struct Anim *)anim, (const u32 *)0x087A256C, (const u32 *)0x087A256C, (const u32 *)0x087A256C, (const u32 *)0x087A256C);
    *(struct Anim **)((char *)q + 0x60) = e;
    *(u16 *)((char *)e + 2) = *(u16 *)((char *)anim + 2);
    *(u16 *)((char *)e + 4) = *(u16 *)((char *)anim + 4);
    SpellFx_RegisterObjGfx((const void *)0x087A1D3C, 0x1000);
    SpellFx_RegisterObjPal((const void *)0x087A22E8, 0x20);
}
