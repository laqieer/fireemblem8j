#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "soundwrapper.h"

extern u8 data_085FF308[];
ProcPtr sub_805CF64(struct Anim * anim, void * a2) {
    gEfxBgSemaphore += 1;
    {
        void *q = Proc_Start((const struct ProcCmd *)data_085FF308, (ProcPtr)3);
        *(void **)((char *)q + 0x5c) = anim;
        *(void **)((char *)q + 0x60) = a2;
        *(u16 *)((char *)q + 0x2c) = 0;
        *(u16 *)((char *)q + 0x2e) = 1;
        {
            int t = *(s16 *)((char *)anim + 2);
            PlaySFX(0xcd, 0x100, t, 1);
        }
        return q;
    }
}
