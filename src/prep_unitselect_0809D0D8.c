#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

void PrepUnit_UpdateScrollArrows(struct ProcPrepUnit *proc)
{
    int msk = 0;
    int dif = proc->yDiff_cur / 16;
    int amt = (PrepGetUnitAmount() - 1) >> 1;

    if (dif > 0)
        msk = 1;
    if ((dif + 5) < amt)
        msk |= 2;

    SetUiSpinningArrowConfig(msk);
}
