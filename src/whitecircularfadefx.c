#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmfx.h"

/**
 * Some white circular fade effect proc. Seems unused
 */


struct ProcWhiteCircleFx {
    PROC_HEADER;

    /* 2C */ int xPos;
    /* 30 */ int yPos;

    /* 34 */ u8 _pad_34[0x4C - 0x34];

    /* 4C */ s16 counter;
};

/* function declarations */

void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx *proc);
void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx *proc);



/* section.data */



/* section.text */

void ProcWhiteCircleFx_Loop(struct ProcWhiteCircleFx *proc)
{
    u16 _sqrt;
    int x, y, xTile, yTile, wight;
    int val = 0x40 - proc->counter * 5;

    for (y = 0; y < 0x14; y++) {
        for (x = 0; x < 0x1E; x++) {
            xTile = ABS(proc->xPos - x * 8);
            yTile = ABS(proc->yPos - y * 8);

            _sqrt = Sqrt(xTile * xTile + yTile * yTile);
            wight = _sqrt + val;

            if (wight < 0)
                wight += 3;

            wight = 0xF - (wight >> 2);

            LIMIT_AREA(wight, 0, 0xF);
            
            gBG0TilemapBuffer[TILEMAP_INDEX(x, y)] =
                TILEREF(BGCHR_BMFX_IMG + wight, BGPAL_WHILTECIRCLE_FADE);
        }
    }

    BG_EnableSyncByMask(1);

    proc->counter++;

    if (proc->counter > 0x46)
        Proc_Break(proc);
}
