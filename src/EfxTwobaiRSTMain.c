#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void EfxTwobaiRSTMain(struct ProcEfx *proc)
{
    if (++proc->timer == proc->unk44)
        Proc_Break(proc);
}
