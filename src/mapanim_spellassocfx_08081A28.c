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

void PutSparkGfx(int x, int y)
{
    if (x < -4)
        return;

    if (x > 235)
        return;

    if (y < -4)
        return;

    if (y > 155)
        return;

    CallARM_PushToSecondaryOAM(
        (x - 4) & 0x1FF,
        (y - 4) & 0xFF,
        gObject_8x8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2));
}
