#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern u8 data_085E3BC4[];
void NewEfxFlashUnit(struct Anim * anim, int dura1, int dura2, int c) {
    int d1 = (s16)dura1;
    int d2 = (s16)dura2;
    struct ProcEfxFlashing * proc = Proc_Start((const struct ProcCmd *)data_085E3BC4, (ProcPtr)4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = d1;
    proc->terminator2 = d2;
    proc->unk29 = c;
}
