#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmfx.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WhiteCircleFx[];

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

void StartCircularFadeAnim(ProcPtr parent, int x, int y)
{
    int i, j;
    u32 r, b, g;
    struct ProcWhiteCircleFx *proc;
    u32 *cur = BG_CHR_ADDR(BGCHR_BMFX_IMG);
    int val = 0;

    for (i = 0; i < 0x20; i++) {
        for (j = 0; j < 0x8; j++)
            *(cur++) = val;
        val += 0x11111111;
    }

    
    for (i = 0; i < 0x10; i++) {
        r = RGB(i * 2, 0, 0);
        b = RGB(0, 0, i * 2);
        g = RGB(0, i * 2, 0);
        b += g;
        b += r;
        PAL_BG_COLOR(BGPAL_WHILTECIRCLE_FADE, i) = b;
    }

    EnablePaletteSync();
    SetBlendConfig(1, 0x10, 0x10, 0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);
    BG_SetPosition(0, 0, 0);
    ClearBg0Bg1();
    SetBackgroundTileDataOffset(0, 0);

    proc = Proc_Start(ProcScr_WhiteCircleFx, parent);
    proc->xPos = x;
    proc->yPos = y;
    proc->counter = 0;
}
