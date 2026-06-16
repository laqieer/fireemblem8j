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

void SetLinkArenaResultBlend(void)
{
    SetBlendAlpha(8, 12);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 0);

    return;
}
