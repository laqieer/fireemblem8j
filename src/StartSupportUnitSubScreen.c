#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

extern struct ProcCmd gProcScr_SupportUnitSubScreen[];


//! FE8U = 0x080A2C08
void StartSupportUnitSubScreen(s8 fromPrepScreen, int unitIndex, ProcPtr parent) {
    int fp = (s8)fromPrepScreen;
    struct SubScreenProc* proc = Proc_StartBlocking(gProcScr_SupportUnitSubScreen, parent);

    proc->fromPrepScreen = fp;
    proc->unitIdx = unitIndex;

    return;
}
