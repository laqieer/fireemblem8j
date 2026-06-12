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

void PhaseIntro_WaitForEnd(ProcPtr proc)
{
    SetBlendConfig(1, gBmSt.altBlendBCa, gBmSt.altBlendBCb, 0);

    if (Proc_Find(gProcScr_PhaseIntroText) == NULL && Proc_Find(gProcScr_PhaseIntroSquares) == NULL && Proc_Find(gProcScr_PhaseIntroBlendBox) == NULL)
    {
        ClearBg0Bg1();

        SetInterrupt_LCDVCountMatch(NULL);

        BG_SetPosition(0, 0, 0);
        BG_SetPosition(1, 0, 0);
        BG_SetPosition(2, 0, 0);

        Proc_Break(proc);
    }
}
