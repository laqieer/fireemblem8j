#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"

/**
* SallyCir proc. Windowing effect in FE6 when transitioning to
* a sub-menu in the prep screen. Unused in FE7/FE8.
*/


//! FE8U = 0x080977AC
void PrepSallycir_PutColoredText(struct Text * th, u16 * tm, int color, int x, const char * str)
{
    ClearText(th);
    Text_SetColor(th, color);
    Text_SetCursor(th, x);
    Text_DrawString(th, str);
    PutText(th, tm);

    return;
}
