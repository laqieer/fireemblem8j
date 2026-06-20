#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void NewEfxCircleWIN(struct Anim * anim, int terminator, u16 * c, int d, int e) {
    void *q;
    int dd = (s16)d;
    int ee = (s16)e;
    gEfxBgSemaphore += 1;
    q = Proc_Start((const struct ProcCmd *)0x085FF270, (ProcPtr)3);
    *(struct Anim **)((char *)q + 0x5c) = anim;
    *(u16 *)((char *)q + 0x2c) = 0;
    *(u16 *)((char *)q + 0x2e) = 0;
    *(int *)((char *)q + 0x44) = terminator;
    *(u16 **)((char *)q + 0x54) = c;
    GetAnimAnotherSide(anim);
    *(u16 *)((char *)q + 0x32) = dd;
    *(u16 *)((char *)q + 0x3a) = ee;
}
