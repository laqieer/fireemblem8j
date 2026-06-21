#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern u8 data_08601700[];
extern u8 data_0875DF20[];
extern u8 data_0875F138[];
void sub_8065FF0(void *anim) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)data_08601700, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        {
            int z = 0;
            *(u16 *)((char *)q + 0x2c) = z;
            *(int *)((char *)q + 0x44) = z;
        }
        *(int *)((char *)q + 0x48) = 0x080E334E;
        *(int *)((char *)q + 0x4c) = 0x08601718;
        *(int *)((char *)q + 0x50) = 0x08601718;
        SpellFx_RegisterBgGfx((const u16 *)data_0875DF20, 0x2000);
        SpellFx_RegisterBgPal((const u16 *)data_0875F138, 0x20);
        BG_SetPosition(1, 0, 0);
        if (*(s16 *)0x0203E11C != 0) {
            if (GetAnimPosition(*(struct Anim **)((char *)q + 0x5c)) == 0)
                BG_SetPosition(1, 0x18, 0);
            else
                BG_SetPosition(1, 0xe8, 0);
        }
        SpellFx_SetSomeColorEffect();
    }
}
