#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ap.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "mapanim.h"
#include "bmlib.h"

void ManimLevelUpStatGainLabel_Finish(struct ManimLevelUpStatGainLabelProc * proc)
{
    APProc_DeleteAll();
}
