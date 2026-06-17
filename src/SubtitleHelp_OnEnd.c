#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"




void SubtitleHelp_OnEnd(void)
{
    gBmSt.cameraMax.y -= 16;

    CameraMove_0(0);

    Proc_BreakEach(gProcScr_SubtitleHelpDarkener);

    return;
}
