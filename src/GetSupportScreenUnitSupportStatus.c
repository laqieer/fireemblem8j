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

//! FE8U = 0x080A0F6C
int GetSupportScreenUnitSupportStatus(s8 flag, int idx) {
    int i;
    int a;
    int b;
    int c;

    if (flag != 0) {
        int var = GetTotalSupportLevel(idx);

        if (var == MAX_SIMULTANEOUS_SUPPORT_COUNT) {
            return 2;
        }

        if (var == 0) {
            return 0;
        }

        return 1;
    }

    a = 0;
    b = GetTotalSupportLevel(idx);

    c = GetSupportScreenPartnerCount(GetSupportScreenCharIdAt(idx));

    for (i = 0; i < c; i++) {
        a += GetUnitsAverageSupportValue(GetSupportScreenCharIdAt(idx), GetSupportScreenPartnerCharId(idx, i));
    }

    if (a == b) {
        return 2;
    }

    if (b == 0) {
        return 0;
    }

    return 1;
}
