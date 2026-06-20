#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void NewEfxFlashHPBar(struct Anim * anim, int duartion, int duartion2) {
    int _duartion = (s16)duartion;
    int _duartion2 = (s16)duartion2;
    void * proc = Proc_Start((const struct ProcCmd *)0x085E3B74, (ProcPtr)4);
    *(struct Anim **)((char *)proc + 0x5c) = anim;
    *(u16 *)((char *)proc + 0x2c) = 0;
    *(u16 *)((char *)proc + 0x2e) = _duartion;
    *(u16 *)((char *)proc + 0x30) = _duartion2;
    if (_duartion == 0)
        Proc_Break(proc);
}
