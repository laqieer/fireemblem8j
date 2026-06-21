#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern u8 data_086019E0[];
extern u8 data_0877ABCC[];
struct Anim *EfxCreateFrontAnim(struct Anim *, const u32 *, const u32 *, const u32 *, const u32 *);
void sub_8066F04(void *anim, int param) {
    void *q;
    struct Anim *e;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_086019E0, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    *(u16 *)((char *)q + 0x2c) = 0;
    *(u16 *)((char *)q + 0x2e) = param;
    e = EfxCreateFrontAnim((struct Anim *)anim, (const u32 *)data_0877ABCC, (const u32 *)data_0877ABCC, (const u32 *)data_0877ABCC, (const u32 *)data_0877ABCC);
    *(struct Anim **)((char *)q + 0x60) = e;
    *(u16 *)((char *)e + 2) = 0x78;
    *(u16 *)((char *)e + 4) = 0x48;
    *(u16 *)((char *)e + 8) = (*(u16 *)((char *)e + 8) & 0xF3FF) | 0x400;
}
