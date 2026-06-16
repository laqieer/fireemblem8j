#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void NewEfxTwobaiRST(struct Anim *anim, int unk44)
{
    u32 i, j;
    u16 *buf;
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxTwobaiRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = unk44;

    for (i = 0; i < 0x78; i++)
        gpBg1ScrollOffsetList1[i] = -(i / 2);

    buf = gpBg1ScrollOffsetList2;
    for (j = 0; j < 0x78; buf++, j++)
        *buf = -(j / 2);
}
