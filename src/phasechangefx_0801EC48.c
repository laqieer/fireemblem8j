#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"
#include "constants/songs.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */













void PhaseIntroSquares_InLoop(struct PhaseIntroSubProc *proc)
{
    int x, y;

    for (y = 10 - 1; y >= 0; --y) {
        for (x = 15 - 1; x >= 0; --x) {
            int val = (x - proc->timer) + (0x15 - y);
            int newX, newY;
            if (val > 0x10)
                val = 0x10;

            if (val < 0x0)
                val = 0x0;

            val = (0x10 - val) & 0xFE;

            newX = x * 2;
            newY = y * 2;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX+0, y*2+0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+1, y*2+0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+0, y*2+1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+1, y*2+1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);

        }
    }

    proc->timer++;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (0x22 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
