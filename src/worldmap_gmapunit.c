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

//! FE8U = 0x080BAC1C
const void * MMS_GetGfx(u16 idx)
{
    return gMuInfoTable[idx - 1].img;
}

//! FE8U = 0x080BAC30
const void * MMS_GetROMTCS2(u16 idx)
{
    return gMuInfoTable[idx - 1].anim;
}

//! FE8U = 0x080BAC44
u8 * GetMapUnitMMSGfxBuffer(int idx)
{
    return gUnk_6 + idx * 0x2200;
}

//! FE8U = 0x080BAC58
void GmapUnit_Destruct(struct GMapUnitProc * proc)
{
    AP_Delete(proc->ap);
    return;
}
