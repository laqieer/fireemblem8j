#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void sub_805DE30(struct Anim * anim, int a2) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)0x085FF520, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        *(u16 *)((char *)q + 0x2c) = 0;
        *(u16 *)((char *)q + 0x2e) = a2;
        if (GetAnimPosition(anim) == 0)
            *(int *)((char *)q + 0x44) = 0xd8;
        else
            *(int *)((char *)q + 0x44) = -0xd8;
    }
}
