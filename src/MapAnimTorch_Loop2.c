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

void MapAnimTorch_Loop2(struct MAEffectProc * proc)
{
    int ret, ca;

    ret = Interpolate(INTERPOLATE_RCUBIC, 1, 160, proc->frame, 80);
    UpdateMapAnimScanline(proc->xDisplay + 8, proc->yDisplay + 8, ret);

    proc->frame++;

    ca = 0x10 - ((proc->frame - 40) * 0x10) / 30;

    if (ca <= 0)
        ca = 0;

    SetBlendAlpha(ca, 0x10);

    if (proc->frame >= 70)
    {
        Proc_Break(proc);
    }
}
