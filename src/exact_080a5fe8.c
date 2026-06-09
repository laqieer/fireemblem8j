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











int GetSupportScreenCharIdAt(int);
void SupportScreen_DrawUnitNameRow(struct SupportScreenProc*, int);
int GetSupportScreenPartnerCount(int);
void StartSupportUnitSubScreen(s8, int, ProcPtr);

//! FE8U = 0x080A221C
void SupportSubScreen_MakeDimmedObjPalette(void) {
    int i;
    u16* src = PAL_OBJ(0xC);
    u16* dst = PAL_OBJ(0xD);

    for (i = 0; i < 0x10; dst++, src++, i++) {
        *dst = (((*src & 0x1f) >> 1) & 0x1f) + (((*src & 0x3e0) >> 1) & 0x3e0) + (((*src & 0x7c00) >> 1) & 0x7c00);
    }

    return;
}
