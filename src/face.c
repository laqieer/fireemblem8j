
#include "global.h"

#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"

#include "face.h"



























struct ProcCmd CONST_DATA gProcScr_FaceChibiSpr[] =
{
    PROC_REPEAT(FaceChibiSpr_OnIdle),
    PROC_END,
};















//! FE8U = 0x08005B68
void EndFaceChibiSpr(void) {
    Proc_EndEach(gProcScr_FaceChibiSpr);

    return;
}

//! FE8U = 0x08005B78
void PutFace80x72_Standard(u16 * tm, int tileref, const struct FaceData* info) {
    int x = info->xMouth - 1;
    int y = info->yMouth;

    CallARM_FillTileRect(tm, gBattleForecast_0, (u16)tileref);

    tm[TILEMAP_INDEX(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TILEMAP_INDEX(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;

    return;
}

//! FE8U = 0x08005BCC
void PutFace80x72_Raised(u16 * tm, int tileref, const struct FaceData* info) {
    int x = info->xMouth - 1;
    int y = info->yMouth - 1;

    CallARM_FillTileRect(tm, gBattleForecast_1, (u16)tileref);

    tm[TILEMAP_INDEX(x, y) + 0x00 + 0] = tileref + 0x00 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 1] = tileref + 0x00 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 2] = tileref + 0x00 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x00 + 3] = tileref + 0x00 + 0x1F;

    tm[TILEMAP_INDEX(x, y) + 0x20 + 0] = tileref + 0x20 + 0x1C;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 1] = tileref + 0x20 + 0x1D;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 2] = tileref + 0x20 + 0x1E;
    tm[TILEMAP_INDEX(x, y) + 0x20 + 3] = tileref + 0x20 + 0x1F;

    return;
}
