#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

void EkrTriPegasusKnightBgMain(struct ProcEkrTriPegasusKnightBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        const u16 **buf1 = proc->tsalut_left;
        const u16 **buf2 = proc->tsalut_right;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        Proc_Break(proc);
    }
}
