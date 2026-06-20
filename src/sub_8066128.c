#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
void sub_8066128(struct Anim * anim, int a2) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)0x08601748, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        *(u16 *)((char *)q + 0x2c) = 0;
        *(u16 *)((char *)q + 0x2e) = a2;
        SpellFx_RegisterBgGfx((const u16 *)0x08761780, 0x2000);
        SpellFx_RegisterBgPal((const u16 *)0x08762170, 0x20);
        SpellFx_ClearBG1();
        LZ77UnCompWram((const void *)0x087621F0, (void *)0x02019790);
        EfxTmCpyBgHFlip((const void *)0x02019790, (void *)0x020234A8, 0x20, 0x20, 1, 0x100);
        BG_EnableSyncByMask(BG1_SYNC_BIT);
        SpellFx_SetSomeColorEffect();
        BG_SetPosition(1, 0, 0);
        SetWinEnable(0, 0, 0);
    }
}
