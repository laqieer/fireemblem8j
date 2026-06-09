#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

//! FE8U = 0x080BAC64
void GmapUnit_Init(struct GMapUnitProc * proc)
{
    proc->flags = 0;
    proc->animId = 4;
    proc->y = 0;
    proc->x = 0;
    return;
}
