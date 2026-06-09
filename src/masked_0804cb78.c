#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

//! FE8U = 0x0804BDD8
void Sio_BoxTransitionClose_End(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetWinEnable(0, 0, 0);

    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    return;
}
