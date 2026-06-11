#include "global.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"

void MuDeathFade_OnLoop(struct MuEffectProc * proc)
{
    SetBlendConfig(0, (proc->timeLeft--) >> 1, 0x10, 0);
    if (proc->timeLeft == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}
