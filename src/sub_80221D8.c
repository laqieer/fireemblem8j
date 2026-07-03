#include "global.h"
#include "hardware.h"

extern void ClearBg0Bg1(void);

// JP-only leaf: turn on bg0/bg1/bg2/bg3/obj in the dispcnt shadow (high byte of
// gLCDControlBuffer.dispcnt), then tail-call ClearBg0Bg1.
void sub_80221D8(void)
{
    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
    ClearBg0Bg1();
}
