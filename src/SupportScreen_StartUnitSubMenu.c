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

void StartSupportUnitSubScreen(s8 fromPrepScreen, int unitIndex, ProcPtr parent);

//! FE8U = 0x080A1918
void SupportScreen_StartUnitSubMenu(struct SupportScreenProc* proc) {
    StartSupportUnitSubScreen(proc->fromPrepScreen, proc->curIndex, proc);
    return;
}
