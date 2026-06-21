#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern u8 data_08603980[];
extern u8 data_0877F634[];
extern u8 gEfxBgData_086039CC[];
void sub_807069C(void *anim) {
    void *q = Proc_Start((const struct ProcCmd *)data_08603980, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    { int z = 0;
      *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z;
      *(int *)((char *)q + 0x48) = 0x080E48DA; *(int *)((char *)q + 0x4c) = 0x08603998;
      *(int *)((char *)q + 0x50) = 0x08603998; *(int *)((char *)q + 0x54) = (int)gEfxBgData_086039CC;
      *(int *)((char *)q + 0x58) = z; }
    SpellFx_RegisterBgPal((const u16 *)data_0877F634, 0x20); SpellFx_SetSomeColorEffect(); SetBlendConfig(1, 0xb, 7, 0);
    if (*(s16 *)0x0203E11C != 0) { if (GetAnimPosition(*(struct Anim **)((char *)q + 0x5c)) == 0) BG_SetPosition(1, 0xe8, 0); else BG_SetPosition(1, 0x18, 0); }
}
