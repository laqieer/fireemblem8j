#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "unit_icon_data.h"

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

extern UnitIconWait unit_icon_wait_table[];

void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, s8 isBlend)
{
    int blend = isBlend;

    if (x < -16 || x > DISPLAY_WIDTH+16)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT+32)
        return;

    switch (GetInfo(GetClassSMSId(class)).size) {
    case UNIT_ICON_SIZE_16x16:
        PutSpriteExt(layer, OAM1_X(x - 8), blend ? OAM0_Y(y - 16) | OAM0_BLEND : OAM0_Y(y - 16), gObject_16x16, oam2 + 0x40);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSpriteExt(layer, OAM1_X(x - 8), blend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_16x32, oam2);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSpriteExt(layer, OAM1_X(x - 16), blend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_32x32, oam2);
        break;
    }
}
