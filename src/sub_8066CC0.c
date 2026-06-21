#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern u8 data_08601978[];
void sub_8066CC0(void *anim) {
    void *q;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_08601978, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; }
    *(int *)((char *)q + 0x48) = 0x080E3592;
    *(int *)((char *)q + 0x4c) = 0x08601990;
    *(int *)((char *)q + 0x50) = 0x08601990;
    SpellFx_RegisterBgGfx((const u16 *)Img_AuraBg1, 0x2000);
    SpellFx_RegisterBgPal((const u16 *)Pal_AuraBg1, 0x20);
    BG_SetPosition(1, 0, 0);
    SpellFx_SetSomeColorEffect();
}
