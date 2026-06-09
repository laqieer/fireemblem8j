#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

//! FE8U = 0x0804BC3C
void Sio_BoxTransitionOpen_End(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    return;
}
