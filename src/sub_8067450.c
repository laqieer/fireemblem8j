#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern u8 data_08601A40[];
extern u8 data_087A0A80[];
extern u8 data_087A0EF4[];
void sub_8067450(void *anim) {
    void *q;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_08601A40, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    { int z = 0;
      *(u16 *)((char *)q + 0x2c) = z;
      *(int *)((char *)q + 0x44) = 7;
      *(u16 *)((char *)q + 0x2e) = z;
      *(int *)((char *)q + 0x48) = 5; }
    SpellFx_RegisterObjGfx((const u16 *)data_087A0A80, 0x1000);
    SpellFx_RegisterObjPal((const u16 *)data_087A0EF4, 0x20);
}
