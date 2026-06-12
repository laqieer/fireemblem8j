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

//! FE8U = 0x080A1174
void DrawSupportScreenUnitSprites(struct SupportScreenProc* proc) {
    int i;

    int unitCount = GetSupportScreenUnitCount();

    for (i = 0; i < unitCount; i++) {
        u32 y = (i / 3) * 16 + 36 - proc->unk_34;
        int x = i % 3 * 64 + 24;

        if (y - 36 < 83) {
            PutUnitSpriteForClassId(0, x, y, 0xc800, GetSupportScreenClassIdAt(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}
