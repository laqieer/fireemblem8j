#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "unitlistscreen.h"
#include "uiconfig.h"
#include "sysutil.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U: 0x080B2464
bool Config_HandleExit(struct ConfigProc * proc)
{
    EndMenuScrollBar();
    EndMuralBackground();

    Proc_EndEach(gProcScr_DrawConfigUiSprites);
    Proc_EndEach(gProcScr_RedrawConfigHelpText);

    if (proc->loadSoloAnimScreen)
    {
        // Load the Solo Anim unit list and reposition
        // this proc to reload after it ends
        StartUnitListScreenForSoloAnim(proc);
        Proc_Goto(proc, 0);

        return false;
    }

    // Exit the config UI
    return true;
}
