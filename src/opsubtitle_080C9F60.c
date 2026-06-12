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

extern const struct OpSubtitleEnt gOpSubtitleGfxLut[];

/* prototypes for same-file helpers called by this run */
void OpSubtitle_LoadTitleSlide(int index);

//! FE8U = 0x080C51A8
void OpSubtitle_ReloadTitleSlide(void) {
    OpSubtitle_LoadTitleSlide(2);

    ApplyPalette(gPal_OpSubtitle, 3);
    EnablePaletteSync();

    return;
}
