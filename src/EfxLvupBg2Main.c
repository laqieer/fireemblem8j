#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"
#include "hardware.h"
#include "mapanim.h"
#include "ctc.h"
#include "bmlib.h"

void EfxLvupBg2Main(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        return;
    }

    if (ret == -1)
        Proc_Break(proc);
}
