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



void MapAnimEffectAnimator_Loop1(struct ProcMapAnimator * proc)
{
    proc->ca++;

    if (proc->ca == 0x10)
    {
        Proc_Break(proc);
    }

    proc->cb = 0x16 - proc->ca;

    if (proc->cb > 0x10)
        proc->cb = 0x10;

    SetBlendAlpha(proc->ca, proc->cb);

    SetBlendTargetA(0, 0, 1, 0, 0); SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);
}
