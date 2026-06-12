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





/* prototypes for same-file helpers called by this run */
void DrawEventMapAnimMaskfx(int index, int mode);

void DisplayEventMapAnim(ProcPtr parent, int val)
{
    struct ProcEventMapAnim * proc = Proc_StartBlocking(ProcScr_EventMapAnim, parent);

#ifndef NONMATCHING
    asm("add r2, r0, #0");
#endif
    proc->mode = val;

    SetDispEnable(0, 0, 1, 1, 1);
    FlushLCDControl();
    
    BG_SetPosition(0, 0, 0xFFD4);
    BG_SetPosition(1, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    SetBlendConfig(1, 4, 0xC, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_SQUARES));
    ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);

    DrawEventMapAnimMaskfx(0, 0);
    ApplyPalette(Pal_EventMapAnimMaskfx, 0);

    if (0 == val) {
        Decompress(Img_Congratulations, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_Congratulations, 0x12);
    } else {
        Decompress(Img_MapClear, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_MapClear, 0x12);
    }

    BG_EnableSyncByMask(3);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}
