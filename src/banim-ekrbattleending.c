#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"
#include "bmmap.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmio.h"
#include "sio.h"



void ekrBattleEnding_3(struct ProcEkrBattleEnding * proc)
{
    int val;

    proc->timer = 0;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    AnimClearAll();
    NewEkrUnitKakudai(1);
    NewEkrBaseKaiten(1);
    NewEkrWindowAppear(1, 0xB);
    NewEkrBaseAppear(1, 0xB);
    Proc_Break(proc);
}

void ekrBattleEnding_4(struct ProcEkrBattleEnding * proc)
{
    if (++proc->timer > 0xC)
    {
        EndEkrGauge();
        Proc_Break(proc);
        InitBmBgLayers();
        
        SetWinEnable(1, 0, 0);
        SetWin0Box(0, 0, 0, 0);
        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 0);
    }
}

void ekrBattleEnding_5(struct ProcEkrBattleEnding * proc)
{
    proc->timer = 0;
    proc->terminator = 0xF;
    ResetUnitSprites();
    BMapDispResume_FromBattleDelayed();
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    ApplyUnitSpritePalettes();

    SetBlendConfig(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    if (GetBattleAnimArenaFlag() != 1)
        UnpackChapterMapPalette();

    if (GetBanimLinkArenaFlag() == 1)
        LoadLinkArenaFogPlaceholder();
    
    Proc_Break(proc);
}

void ekrBattleEnding_6(struct ProcEkrBattleEnding * proc)
{
    int left, top, right, bottom;

    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, proc->x1, 0,    proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, proc->y1, 0,    proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, proc->x2, 0xF0, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, proc->y2, 0xA0, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);
    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}

void ekrBattleEnding_7(struct ProcEkrBattleEnding * proc)
{
    EndEkrBattleDeamon();
    RefreshBMapDisplay_FromBattle();
    Proc_Break(proc);
}
