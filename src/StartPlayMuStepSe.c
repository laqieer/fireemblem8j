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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_MuStepSe[];

void StartPlayMuStepSe(int song, int alt_offset, int x)
{
    struct MuStepSoundProc * proc;

    proc = Proc_Find(ProcScr_MuStepSe);

    if (!proc)
        proc = Proc_Start(ProcScr_MuStepSe, PROC_TREE_3);

    if (!proc->song1)
    {
        proc->song1 = song;
        proc->x1 = x;
    }
#if BUGFIX
    else if (!proc->song2)
#else
    else if (!proc->unk60)
#endif
    {
        proc->song2 = song + alt_offset;
        proc->x2 = x;
    }
}
