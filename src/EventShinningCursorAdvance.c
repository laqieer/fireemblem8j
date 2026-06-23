#include "global.h"
#include "hardware.h"
#include "functions.h"
#include "variables.h"
#include "event.h"

u16 EventShinningCursorAdvance(s16 x, s16 y, s16 counter)
{
    u16 tmp_counter0 = counter;
    s16 tmp_x = (x << 0x14) >> 0x10;
    s16 tmp_y = (y << 0x14) >> 0x10;

    tmp_x = - gBmSt.camera.x + tmp_x;
    tmp_y = - gBmSt.camera.y + tmp_y;

    CallARM_PushToSecondaryOAM(
        (tmp_x + 0x200) & 0x1FF,
        (tmp_y + 0x100) & 0xFF,
        Obj_EventShinningCursor,
        0x2822);

    if (tmp_counter0 <= 0xF) {
        ShinningEventCursor(0x10, 0x0, tmp_counter0 / 2);
        tmp_counter0++;
    }
    else {
        ShinningEventCursor(0x0, 0x10, tmp_counter0 / 2 - 0x8);
        tmp_counter0++;

        if (tmp_counter0 > 0x1F)
            tmp_counter0 = 0;
    }

    return tmp_counter0;
}
