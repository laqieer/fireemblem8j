#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void StatScreen_Display(struct Proc* proc);

void UnitSlide_FadeOutLoop(struct StatScreenEffectProc* proc)
{
    SetBlendConfig(1, proc->timer, 0x10 - proc->timer, 0);

    SetMuScreenPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = Interpolate(2, proc->yDispInit, proc->yDispFinal, proc->timer, 0x10);

    proc->timer += 3;

    if (proc->timer > 0x10)
        Proc_Break(proc);
}

void UnitSlide_InitFadeIn(struct StatScreenEffectProc* proc)
{
    proc->timer = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 0;

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 1, 0, 1);

    if (proc->direction > 0)
    {
        proc->yDispInit = +60;
        proc->yDispFinal = 0;
    }
    else
    {
        proc->yDispInit = -60;
        proc->yDispFinal = 0;
    }
}

void UnitSlide_FadeInLoop(struct StatScreenEffectProc* proc)
{
    SetBlendConfig(1, 0x10 - proc->timer, proc->timer, 0);

    SetMuScreenPosition(gStatScreen.mu,
        80, 138 + gStatScreen.yDispOff);

    gStatScreen.yDispOff = Interpolate(5, proc->yDispInit, proc->yDispFinal, proc->timer, 0x10);

    proc->timer += 3;

    if (proc->timer >= 0x10)
        Proc_Break(proc);
}

void UnitSlide_SetNewUnit(struct StatScreenEffectProc* proc)
{
    gStatScreen.unit = GetUnit(proc->newItem);

    StatScreen_Display(Proc_Find(gProcScr_StatScreen));
    Proc_Break(proc);
}

void ClearSlide(struct Proc* proc)
{
    if (gStatScreen.mu)
        SetMuScreenPosition(gStatScreen.mu,
            80, 138);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDefaultColorEffects();

    gStatScreen.inTransition = FALSE;
}

void StartUnitSlide(struct Unit* unit, int direction, struct Proc* parent)
{
    struct StatScreenEffectProc* proc = (void*) Proc_StartBlocking(gProcScr_SSUnitSlide, parent);

    proc->newItem = unit->index;
    proc->direction = direction;

    PlaySoundEffect(SONG_C8);
}

void DisplayPageNameSprite(int pageid)
{
    int colorid;

    PutSprite(4,
        111 + gStatScreen.xDispOff, 1 + gStatScreen.yDispOff,
        sSprite_PageNameBack, TILEREF(0x293, 4) + 0xC00);

    PutSprite(4,
        114 + gStatScreen.xDispOff, 0 + gStatScreen.yDispOff,
        sPageNameSpriteLut[pageid], TILEREF(0x240 + sPageNameChrOffsetLut[pageid], 3) + 0xC00);

    colorid = (GetGameClock()/4) % 16;

    CpuCopy16(
        gUnkData_33[pageid] + colorid,
        PAL_OBJ(3) + 0xE,
        sizeof(u16));

    EnablePaletteSync();
}

void PageNameCtrl_OnInit(struct StatScreenPageNameProc* proc)
{
    // TODO: maybe a macro that takes angle/xScale/yScale?

    SetObjAffine(
        8,  // oam rotscale index

        Div(+COS(0) * 16, 0x100), // pa
        Div(-SIN(0) * 16, 0x100), // pb
        Div(+SIN(0) * 16, 0x100), // pc
        Div(+COS(0) * 16, 0x100)  // pd
    );

    proc->pageNum = gStatScreen.page;
}
