#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void SpellFx_Begin(void); void SpellFx_ClearBG1Position(void);
void sub_805E5D0(struct Anim *anim) {
    ProcPtr proc;
    SpellFx_Begin();
    SpellFx_ClearBG1Position();
    proc = Proc_Start((const struct ProcCmd *)0x085FF628, (ProcPtr)3);
    *(void **)((char *)proc + 0x5c) = anim;
    *(u16 *)((char *)proc + 0x2c) = 0;
    *((u8 *)proc + 0x29) = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}
