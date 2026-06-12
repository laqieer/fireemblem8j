#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"
#include "constants/songs.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */













void PhaseIntro_InitDisp(ProcPtr proc)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 0, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    gBmSt.altBlendBCa = 0;
    gBmSt.altBlendBCb = 0x10;

    gBmSt.altBlendACa = 0;
    gBmSt.altBlendACb = 0x10;

    SetBlendConfig(1, gBmSt.altBlendBCa, gBmSt.altBlendBCb, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetLCDVCountSetting(0);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchHi);
}
