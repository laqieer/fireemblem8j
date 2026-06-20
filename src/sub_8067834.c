#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmlib.h"
void sub_8067834(void * anim, int a1, int a2) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)0x08601C68, (ProcPtr)4);
        *(void **)((char *)q + 0x5c) = anim;
        *(u16 *)((char *)q + 0x2c) = 0;
        CpuFastSet((const void *)0x020228A8, (void *)0x020165C8, 0x100);
        *(u16 *)((char *)q + 0x2e) = a2;
        *(u16 *)((char *)q + 0x30) = a1;
    }
}
