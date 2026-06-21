#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern u8 data_08601B98[];
extern u8 data_0878CE88[];
extern u8 gEfxBgData_08601BB0[];
void sub_8067634(void *anim) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)data_08601B98, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        {
            int z = 0;
            *(u16 *)((char *)q + 0x2c) = z;
            *(int *)((char *)q + 0x44) = z;
            *(int *)((char *)q + 0x48) = 0x080E3690;
            *(int *)((char *)q + 0x4c) = 0x08601BD8;
            *(int *)((char *)q + 0x50) = 0x08601BD8;
            *(int *)((char *)q + 0x54) = (int)gEfxBgData_08601BB0;
            *(int *)((char *)q + 0x58) = z;
        }
        SpellFx_RegisterBgPal((const u16 *)data_0878CE88, 0x20);
        SpellFx_SetSomeColorEffect();
    }
}
