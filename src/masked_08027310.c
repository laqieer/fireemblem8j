#include "global.h"

#include "hardware.h"
#include "unit_icon_data.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "chapterdata.h"
#include "ctc.h"
#include "mu.h"
#include "worldmap.h"

#include "bmudisp.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/event-flags.h"
#include "constants/video-global.h"

/**
* Display standing map sprites and various tile/unit markers
*/

extern UnitIconWait unit_icon_wait_table[];








struct SMSHandle EWRAM_DATA gSMSHandleArray[100] = {};
struct SMSHandle * EWRAM_DATA gSMSHandleIt = NULL;



























































































#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

struct SMSHandle * AddUnitSprite(int y)
{
    struct SMSHandle * it = gSMSHandleArray;

    while (1) {
        if (it->pNext == NULL || it->pNext->yDisplay < y)
        {
            gSMSHandleIt->pNext = it->pNext;
            gSMSHandleIt = (it->pNext = gSMSHandleIt) + 1;

            return it->pNext;
        }

        it = it->pNext;
    }
}
