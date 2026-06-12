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

//! FE8U = 0x080C5548
void Title_SetBg2AffineScale(int arg) {
    struct BgAffineSrcData src;

    src.texX = 0x7800;
    src.texY = 0x5000;
    src.scrX = 0x78;
    src.scrY = 0x50;


    src.sx = arg;
    src.sy = arg;

    src.alpha = 0;

    BgAffineSet(&src, &gLCDControlBuffer.bg2affin, 1);

    return;
}
