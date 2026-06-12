#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "chapterdata.h"
#include "playerphase.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "gba_sprites.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/video-global.h"
#include "constants/songs.h"





















































































extern CONST_DATA u16 Obj_EventsScriptUtils_0[];

extern CONST_DATA u16 * ImgLut_EventMapAnimMaskfx[];

extern u16 CONST_DATA * TsaLut_EventMapAnimMaskfx[];

void EventMapAnim_SlideSquaresInLoop(struct ProcEventMapAnim * proc)
{
    int iy, ix;
    struct Proc89EEA28 *child;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = (0x10 - val) & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);
        }
    }

    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        proc->timer = 0;
        child = Proc_Start(gEventsScriptUtils_0, proc);
        child->mode = proc->mode;
        Proc_Break(proc);
    }
}
