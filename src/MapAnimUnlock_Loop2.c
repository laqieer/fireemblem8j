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

void MapAnimUnlock_Loop2(struct MAEffectProc * proc)
{
    int ret = Interpolate(INTERPOLATE_RCUBIC, 0x10, 0, proc->unk48, 30);

    proc->unk48++;

    UpdateMapAnimScanline(proc->xDisplay, proc->yDisplay, ret);

    if (proc->unk48 >= 30)
        Proc_Break(proc);
}
