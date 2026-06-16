#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

struct ProcSelfThunderBG {
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 _pad_29[0x5C - 0x29];
    /* 5C */ struct Anim *anim;
};

extern struct ProcCmd ProcScr_ekrSelfThunderBG[];

void NewEkrSelfThunderBG(struct Anim *anim)
{
    struct ProcSelfThunderBG *proc;
    proc = Proc_Start(ProcScr_ekrSelfThunderBG, PROC_TREE_3);
    proc->anim = anim;
    SpellFx_SetSomeColorEffect();
}
