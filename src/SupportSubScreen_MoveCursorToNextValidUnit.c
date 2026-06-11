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

//! FE8U = 0x080A2154
void SupportSubScreen_MoveCursorToNextValidUnit(struct SubScreenProc* proc, int partnerIdx, int step) {
    while (1) {
        if (partnerIdx < 0) {
            return;
        }

        if (partnerIdx > (proc->partnerCount - 1)) {
            return;
        }

        if (proc->partnerState[partnerIdx] & 1) {
            if (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) > 0) {
                proc->unk_39 = (proc->unk_39 & 0xe3) + ((partnerIdx & 7) << 2);

                if ((proc->unk_39 & 3) >= GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx)) {
                    proc->unk_39 = (proc->unk_39 & 0xfc) + (GetSupportScreenPartnerSupportLevel(proc->unitIdx, partnerIdx) - 1);
                }

                return;
            }
        }

        partnerIdx += step;
    }

    return;
}
