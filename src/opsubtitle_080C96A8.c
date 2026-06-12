#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"

#include "constants/songs.h"

/*
The opening monologue that introduces the Sacred Stones / associated lore.
*/

struct OpSubtitleProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 index;
    /* 2A */ s16 timer_2a;
    /* 2C */ s16 timer_2c;

    /* 2E */ u8 pad[0x4c-0x2e];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct OpSubtitleEnt {
    void* gfx;
    void* tsa;
    int timer;
};



//! FE8U = 0x080C48F0
void OpSubtitle_FillBgIncrementalTiles(int bg) {
    u16* mapBuf;
    int tmp;
    int i;

    mapBuf = BG_GetMapBuffer(bg);
    tmp = 0xF000;

    for (i = 0; i < 0x280; mapBuf++, i++) {
        *mapBuf = tmp + i;
    }

    return;
}
