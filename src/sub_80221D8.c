#include "global.h"
#include "hardware.h"

extern void sub_804F610(void);

// JP-only leaf: turn on bg0/bg1/bg2/bg3/obj in the dispcnt shadow (high byte of
// gLCDControlBuffer.dispcnt), then tail-call sub_804F610.
void sub_80221D8(void)
{
    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
    sub_804F610();
}
