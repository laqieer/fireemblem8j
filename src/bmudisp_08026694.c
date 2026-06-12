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
/* TU-private data externs bound at their JP addresses */
extern u8* UnitSpriteUnpackBuf;
extern int gSomeSMSLookupTable_0[];
extern u8 gUnitSpriteSlots[];
extern UnitIconWait unit_icon_wait_table[];

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

int ApplyUnitSpriteImage16x32(int slot, u32 id);
int ApplyUnitSpriteImage32x32(int slot, u32 id);
int ApplyUnitSpriteUiImage16x16(int slot, u32 id);

int StartUiSMS(int smsId, int frameId)
{
    int slot = gSomeSMSLookupTable_0[frameId];
    Decompress(GetInfo(smsId).sheet, UnitSpriteUnpackBuf);

    switch (GetInfo(smsId).size) {
    case UNIT_ICON_SIZE_16x16:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteUiImage16x16(slot, smsId) / 2;
        break;

    case UNIT_ICON_SIZE_16x32:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;
        break;

    case UNIT_ICON_SIZE_32x32:
        gUnitSpriteSlots[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;
        break;
    }

    return gUnitSpriteSlots[frameId] << 1;
}
