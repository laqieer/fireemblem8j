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

//! FE8U = 0x080A207C
void InitSupportSubScreenRemainingSupports(struct SubScreenProc* proc) {
    int i;

    if (proc->fromPrepScreen) {
        proc->remainingSupports = 5 - GetTotalSupportLevel(proc->unitIdx);
    } else {
        int charId = GetSupportScreenCharIdAt(proc->unitIdx);

        proc->remainingSupports = 0;

        for (i = 0; i < proc->partnerCount; i++) {
            proc->remainingSupports += GetUnitsAverageSupportValue(charId, GetSupportScreenPartnerCharId(proc->unitIdx, i));
        }

        proc->remainingSupports -= GetTotalSupportLevel(proc->unitIdx);
    }

    return;
}
