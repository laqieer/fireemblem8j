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




extern CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[];

void StartStarRotationEffect(int xCenter, int yCenter, int lo, int hi, int start, int end, int terminator)
{
    struct MAStarProc * proc =
        Proc_Start(ProcScr_MapAnimSpellAssocRotationEffect, PROC_TREE_3);

    proc->xCenter = xCenter;
    proc->yCenter = yCenter;
    proc->lo = lo;
    proc->hi = hi;
    proc->start = start;
    proc->end = end;
    proc->terminator = terminator;
}
