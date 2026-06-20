#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
void sub_805DD38(void *anim, int a2) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)0x085FF508, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        *(u16 *)((char *)q + 0x2c) = 0;
        *(u16 *)((char *)q + 0x2e) = a2;
        SpellFx_RegisterBgPal((const u16 *)0x0860A374, 0x20);
        SpellFx_RegisterBgGfx((const u16 *)0x086094B4, 0x2000);
        LZ77UnCompWram((const void *)0x0860A474, (void *)0x02019790);
        if (GetAnimPosition(*(struct Anim **)((char *)q + 0x5c)) == 0)
            EfxTmCpyBG((const void *)0x02019790, (void *)0x020234A8, 0x20, 0x14, 1, 0x100);
        else
            EfxTmCpyBgHFlip((const void *)0x02019790, (void *)0x020234A8, 0x20, 0x14, 1, 0x100);
        BG_EnableSyncByMask(BG1_SYNC_BIT);
        SpellFx_SetSomeColorEffect();
        SetWinEnable(0, 0, 0);
    }
}
