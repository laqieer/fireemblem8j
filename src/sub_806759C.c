#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
struct Anim *EfxCreateFrontAnim(struct Anim *, const u32 *, const u32 *, const u32 *, const u32 *);
void AnimSort(void);
void sub_806759C(void *anim) {
    void *q; struct Anim *e;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)0x08601B68, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    e = EfxCreateFrontAnim((struct Anim *)anim, (const u32 *)0x087A1C04, (const u32 *)0x087A1C04, (const u32 *)0x087A1C04, (const u32 *)0x087A1C04);
    *(struct Anim **)((char *)q + 0x60) = e;
    *(u16 *)((char *)e + 2) = 0x78;
    *(u16 *)((char *)e + 4) = 0x3c;
    *(u16 *)((char *)e + 8) = (*(u16 *)((char *)e + 8) & 0xF3FF) | 0xC00;
    *(u16 *)((char *)e + 0xa) = 0x14;
    AnimSort();
}
