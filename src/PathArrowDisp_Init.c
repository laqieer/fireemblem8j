#include "global.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "bmlib.h"
#include "bmmind.h"
#include "variables.h"

void PathArrowDisp_Init(u8 a) {
    int v = (s8)a;
    Decompress(gUnkData_38, (void *) OBJ_VRAM0 + 0x5E00);
    ApplyPalette(gUnkData_39, 0x13);
    if (v == 0) {
        gpPathArrowProc->maxMov =
            gActiveUnit->movBonus + gActiveUnit->pClassData->baseMov - gActionData.moveCount;
        CutOffPathLength(0);
        AddPointToPathArrowProc(gActiveUnit->xPos, gActiveUnit->yPos);
        gpPathArrowProc->pathCosts[0] = gpPathArrowProc->maxMov;
        // This seems strange. But passing -1 to a signed argument doesn't seem to match
        SetLastCoords(0xFFFF, 0xFFFF);
        UpdatePathArrowWithCursor();
    }
}
