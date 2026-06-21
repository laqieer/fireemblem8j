#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern u8 data_086019F8[];
void NewEfxFlashBgWhite(struct Anim *, int);
void sub_8066F9C(void *anim, int a1, int a2) {
    void *q;
    (*(int *)0x0201774C)++;
    q = Proc_Start((const struct ProcCmd *)data_086019F8, (ProcPtr)3);
    *(void **)((char *)q + 0x5c) = anim;
    *(u16 *)((char *)q + 0x2c) = 0;
    *(u16 *)((char *)q + 0x2e) = a2;
    NewEfxFlashBgWhite((struct Anim *)anim, a1);
}
