#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"



void MapLatonaShiningfx_Loop1(struct MAAnotherProc * proc)
{
    proc->timer2 += 2;

    SetBlendConfig(1, proc->timer2, 0x10, 0);

    if (proc->timer2 > 7)
    {
        proc->timer2 = 0;
        Proc_Break(proc);
    }
}
