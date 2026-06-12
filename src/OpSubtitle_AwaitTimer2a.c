extern int OpSubtitle_HandleStartPress();
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

//! FE8U = 0x080C4C3C
void OpSubtitle_AwaitTimer2a(struct OpSubtitleProc* proc) {

    proc->timer_2a--;

    if (proc->timer_2a < 1) {
        Proc_Break(proc);
    }

    OpSubtitle_HandleStartPress(proc);

    return;
}
