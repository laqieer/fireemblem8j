#include "gbafe.h"



void NewEkrSelfThunder(struct Anim *anim)
{
    struct ProcEfxDKfx *proc;
    PlaySFX(0x37E, 0x100,0x78, 0x0);
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_ekrSelfThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}
