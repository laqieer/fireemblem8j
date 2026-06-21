#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern u8 data_086017A8[];
extern u8 data_08762468[];
extern u8 data_08762C54[];
extern u8 data_087632D4[];
struct Anim *EfxCreateFrontAnim(struct Anim *, const u32 *, const u32 *, const u32 *, const u32 *);
void sub_80663A8(void *anim, int param) {
    void *q; struct Anim *e;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_086017A8, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    *(u16 *)((char *)q + 0x2c) = 0;
    *(u16 *)((char *)q + 0x2e) = param;
    e = EfxCreateFrontAnim((struct Anim *)anim, (const u32 *)data_087632D4, (const u32 *)data_087632D4, (const u32 *)data_087632D4, (const u32 *)data_087632D4);
    *(struct Anim **)((char *)q + 0x60) = e;
    *(u16 *)((char *)e + 2) = 0x78;
    *(u16 *)((char *)e + 4) = 0x48;
    
    SpellFx_RegisterObjPal((const u16 *)data_08762C54, 0x20);
    SpellFx_RegisterObjGfx((const u16 *)data_08762468, 0x1000);
}
