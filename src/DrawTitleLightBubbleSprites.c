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
/* TU-private data externs bound at their JP addresses */
extern s8 gTitlescreen_0[];
extern struct Unknown08AA6858 gTitlescreen_1[];

struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

//! FE8U = 0x080C6144
void DrawTitleLightBubbleSprites(int arg) {

    struct Unknown08AA6858* it = gTitlescreen_1;

    while (it->a != 0) {
        int m;
        int n;
        int xOam1;
        int yOam0;

        m = gTitlescreen_0[it->c * 2 + 0];
        xOam1 = Interpolate(0, (m * it->a) >> 8, (it->b * m) >> 8, arg, 24) + 116;

        n = gTitlescreen_0[it->c * 2 + 1];
        yOam0 = Interpolate(0, (n * it->a) >> 8, (it->b * n) >> 8, arg, 24) + 56;

        PutSpriteExt(
            4,
            (xOam1) & 0x01FF,
            ((yOam0) & 0xff) | 0x400,
            gObject_8x8,
            (it->d + 0x2a0) | 0x7400
        );

        it++;
    }

    return;
}
