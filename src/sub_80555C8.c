#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern u8 data_085E3BEC[];
void NewEfxFlashUnitEffectEnd(struct Anim * anim, int dura1, int dura2, int c) {
    int duartion1 = (s16)dura1;
    int duartion2 = (s16)dura2;
    struct ProcEfxFlashing * proc = Proc_Start((const struct ProcCmd *)data_085E3BEC, (ProcPtr)4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion1;
    proc->terminator2 = duartion2;
    proc->unk29 = c;
    anim->state3 |= ANIM_BIT3_BLOCKING;
    anim->state |= ANIM_BIT_FROZEN;
    anim->timer = 0x2;
}
