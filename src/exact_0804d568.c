#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

//! FE8U = 0x0804C7C8
void SioMenuItem_SetArrowConfig(struct SioMenuItemProc * proc, int xLeft, int xRight, int leftSpeed, int rightSpeed)
{
    proc->xLeftArrow = xLeft;
    proc->xRightArrow = xRight;
    proc->leftArrowSpeed = leftSpeed;
    proc->rightArrowSpeed = rightSpeed;

    return;
}
