#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void sub_805E488(struct Anim *anim)
{
    ProcPtr proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();
    proc = Proc_Start((const struct ProcCmd *)0x085FF5F0, (ProcPtr)3);
    *(void **)((char *)proc + 0x5c) = anim;
    *(u16 *)((char *)proc + 0x2c) = 0;
    *((u8 *)proc + 0x29) = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}
