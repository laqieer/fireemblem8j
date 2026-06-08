#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"












 // equipped item icons

// clang-format off











//! FE8U = 0x08090514
void UnitList_SetMuralWindow(s8 flag)
{
    if (flag != 0)
    {
        SetWinEnable(1, 1, 0);

        SetWin0Box(0, 58, 240, 152);
        SetWin1Box(0, 0, 240, 32);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWin1Layers(0, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 0);
    }
    else
    {
        SetWinEnable(1, 0, 0);

        SetWin0Box(0, 58, 240, 152);

        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(0, 1, 1, 1, 1);
    }

    return;
}
