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

/* prototypes for same-file helpers called by this run */
void Title_EndSkipFxListener(void);

//! FE8U = 0x080C63D0
void Title_RestartProc(struct TitleScreenProc* proc) {

    EndAllProcChildren(proc);

    Title_EndSkipFxListener();

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;

    EnablePaletteSync();

    proc->mode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    StartBgmExt(SONG_MAIN_THEME, 0, 0);

    return;
}
