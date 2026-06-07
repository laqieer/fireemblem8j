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





















































































CONST_DATA u16 Obj_EventsScriptUtils_0[] = {
    3,
    0x4100, 0xC000, 0x2200,
    0x4100, 0xC040, 0x2208,
    0x4100, 0xC080, 0x2210
};





/* prototypes for same-file helpers called by this run */
void DrawEventMapAnimMaskfx(int index, int mode);
void DrawEventMapAnimMaskfxTsa(int index, int mode);

void EventMapAnim_SlideSquaresOutLoop(struct ProcEventMapAnim * proc)
{
    int iy, ix;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = val & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
        }
    }
    
    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        Proc_EndEach(gEventsScriptUtils_0);
        proc->timer = 0;
        proc->count = 0;
        SetBlendConfig(1, 0x10, 0x10, 0);
        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 1, 1, 1, 1);
        Proc_Break(proc);
    }
}

void EventMapAnim_DrawMaskfxLoop(struct ProcEventMapAnim * proc)
{
    switch (proc->timer) {
        case 0:
            DrawEventMapAnimMaskfxTsa(proc->count, 1 & proc->count);
            BG_EnableSyncByMask(1);
            proc->count += 1;
            break;

        case 1:
            if (6 == proc->count) {
                Proc_Break(proc);
                return;
            }
            DrawEventMapAnimMaskfx(proc->count, 1 & proc->count);
            proc->timer = -1;
            break;

        default:
            break;
    }

    proc->timer++;
}

void EventMapAnim_End(struct ProcEventMapAnim * proc)
{
    BG_SetPosition(0, 0, 0);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(3);
    SetDefaultColorEffects();
}

void EventMapAnimBanner_Init(struct Proc89EEA28 * proc)
{
    proc->timer = 0;
}

void EventMapAnimBanner_SlideInLoop(struct Proc89EEA28 * proc)
{
    int val1 = Interpolate(0, -24, 0, proc->timer, 0x10);
    int val2 = Interpolate(0, 2, 0x100, proc->timer, 0x10);

    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val2),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, val2)
    );
    
    PutSprite(
        0, 0x1FF & (val1 + 0x18), 0x40,
        Obj_EventsScriptUtils_0, 0
    );

    if (0x10 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void EventMapAnimBanner_FlashInLoop(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0, 0x10, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_EventsScriptUtils_0, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void EventMapAnimBanner_FlashOutLoop(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_EventsScriptUtils_0, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void EventMapAnimBanner_HoldLoop(struct Proc89EEA28 * proc)
{
    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, 0x100),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, 0x100)
    );
    PutSprite(0, 0x18, 0x40, Obj_EventsScriptUtils_0, 0);

    if (0x20 == proc->timer)
        Proc_BreakEach(ProcScr_EventMapAnim);

    proc->timer++;
}
