#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern u8 data_08601978[];
extern u8 frontier_df4_misc_lo_008_0E2638[];
/* Preserve the original separate literal-pool load for this interior address. */
extern u8 data_08601990[];
asm(".set data_08601990, data_08601978 + 0x18");
void sub_8066CC0(void *anim) {
    void *q;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_08601978, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; }
    *(int *)((char *)q + 0x48) = (int)(frontier_df4_misc_lo_008_0E2638 + 0xF5A);
    *(int *)((char *)q + 0x4c) = (int)data_08601990;
    *(int *)((char *)q + 0x50) = (int)data_08601990;
    SpellFx_RegisterBgGfx((const u16 *)Img_AuraBg1, 0x2000);
    SpellFx_RegisterBgPal((const u16 *)Pal_AuraBg1, 0x20);
    BG_SetPosition(1, 0, 0);
    SpellFx_SetSomeColorEffect();
}
