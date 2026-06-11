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

//! FE8U = 0x080A20FC
void DrawSupportSubScreenUnitPartnerDetails(struct SubScreenProc* proc) {
    int i;

    ResetUnitSprites();

    for (i = 0; i < proc->partnerCount; i++) {
        proc->partnerClassId[i] = GetSupportScreenPartnerClassId(proc->unitIdx, i);
        UseUnitSprite(GetClassSMSId(proc->partnerClassId[i]));
    }

    ForceSyncUnitSpriteSheet();

    for (i = 0; i < proc->partnerCount; i++) {
        DrawSupportSubScreenUnitPartnerText(proc, i);
    }

    return;
}
