#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

void NewEfxDamageMojiEffect(struct Anim * anim, int hitted)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffect, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = hitted;
    LZ77UnCompVram(Img_NODAMGEMIS, OBJ_VRAM0 + 0x2000);
}
