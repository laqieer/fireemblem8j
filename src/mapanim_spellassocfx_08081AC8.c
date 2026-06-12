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

static struct MapAnimStarfxConf gMapAnimStarfxConfs[0x10];
static u16 sSpellAssocPalBackup[0xA0];

extern CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[];

/* prototypes for same-file helpers called by this run */
void PutSparkGfxRotation(int xCenter, int yCenter, int distance, int angle);

void MapAnimRotation_Main(struct MAStarProc * proc)
{
    int i, ret = Interpolate(5, proc->lo, proc->hi, proc->timer, proc->end) * 16;

    proc->distance = ret;
    proc->angle = ret >> 1;

    for (i = 0; i < 16; ++i)
    {
        PutSparkGfxRotation(
            proc->xCenter, proc->yCenter,
            (proc->distance + gMapAnimStarfxConfs[i].distance) >> 4,
            (proc->angle    + gMapAnimStarfxConfs[i].angle) >> 4);
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
        Proc_Break(proc);
}
