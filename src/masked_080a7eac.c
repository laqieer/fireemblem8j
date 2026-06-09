#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);











CONST_DATA int sSupportUnkLut[][2] = {
    { 0x0100, 0x0100 }, 
    { 0x0000, 0x0000 }
};

int GetUnitsAverageSupportValue(const int unitA, const int unitB)
{
    int i;


    for (i = 0; 0 != sSupportUnkLut[i][0]; i++) {
        if (sSupportUnkLut[i][0] == unitA)
            if (sSupportUnkLut[i][1] != unitB)
                return 2;

        if (sSupportUnkLut[i][0] == unitB)
            if (sSupportUnkLut[i][1] != unitA)
                return 2;
            
        if (sSupportUnkLut[i][1] == unitA)
            if (sSupportUnkLut[i][0] != unitB)
                return 2;

        if (sSupportUnkLut[i][1] == unitB)
            if (sSupportUnkLut[i][0] != unitA)
                return 2;
    }

    return 3;
}
