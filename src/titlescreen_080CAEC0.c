#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"









/* file-scope type definitions used by this run */


struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

//! FE8U = 0x080C60CC
void Title_ClearLightExplosionScratch(void) {
    int i;

    for (i = 0; i <= 3; i++) {
        u8* buf = gGenericBuffer;
        CpuFastFill(0, buf + (i * 0x400), 0x200);
    }

    return;
}
