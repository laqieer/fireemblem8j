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

//! FE8U = 0x080A11E0
void SupportScreen_ScrollToPendingIndex(struct SupportScreenProc* proc) {
    int a;
    int b;

    if (proc->unk_3c != -1) {
        proc->curIndex = proc->unk_3c;
        proc->unk_3c = -1;

        if ((((proc->curIndex / 3) - (proc->unk_34 / 16)) * 16 + 36) < 37) {
            if ((proc->curIndex / 3) == 0) {
                proc->unk_34 = 0;
            } else {
                proc->unk_34 = ((proc->curIndex / 3) - 1) * 16;
            }
        }

        a = proc->curIndex / 3;
        if ((((a) - (proc->unk_34 / 16)) * 16 + 36) > 115) {
            b = (GetSupportScreenUnitCount() - 1);
            if (a == b / 3) {
                proc->unk_34 = (((GetSupportScreenUnitCount() - 1) / 3) - 5) * 16;
            } else {
                proc->unk_34 = ((proc->curIndex / 3) - 4) * 16;
            }
        }
    }

    return;
}
