#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"

extern struct ProcCmd ProcScr_MapanimEventcall_0[];
void StartMapEventcallFx0(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapanimEventcall_0, proc);
    else
        Proc_Start(ProcScr_MapanimEventcall_0, PROC_TREE_3);
}
