#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void NewProcOpAnimFadeIn(int max, ProcPtr parent);

void OpAnimBldAlphaMain(struct ProcOpAnimBLDALPHA * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, 0x10);
    gLCDControlBuffer.blendCoeffA = ret;
    gLCDControlBuffer.blendCoeffB = 0x10 - ret;

    if (proc->timer == 0x10)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

bool OpAnimBldAlphaExists(void)
{
    return Proc_Find(ProcScr_OpAnimBLDALPHA) ? true : false;
}

void OpAnimUpdateScreen1(struct ProcOpAnim * proc)
{
    SetBlendConfig(1, 8, 0x10, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);
    SetDispEnable(0, 1, 1, 0, 1);
    proc->unk2C = 0;
    proc->unk2E = 0;
}

void OpAnimWorldMapfxMain(struct ProcOpAnim * proc)
{
    if (!(proc->timer & 1))
        proc->unk2C++;

    if (!(proc->timer & 3))
        proc->unk2E++;

    BG_SetPosition(BG_1, proc->unk2C, proc->unk2E);

    if (proc->timer <= 0x60)
    {
        int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x60);
        ApplyPaletteOpAnim(Pal_OpAnimWorldMap, 0);
        BlendPaletteToColor(PAL_BG(0), 0x7FFF, ret);
    }

    if ((u32)(proc->timer - 0x80) <= 0x60)
    {
        int ret = Interpolate(INTERPOLATE_LINEAR, 8, 0, proc->timer - 0x80, 0x60);
        gLCDControlBuffer.blendCoeffA = ret;
    }

    if (proc->timer == 0xEF)
    {
        SetDispEnable(0, 0, 1, 0, 1);
        NewProcOpAnimFadeIn(0x20, proc);
    }

    if (proc->timer == 0x110)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void OpAnimSetupCharacterScene(struct ProcOpAnim * proc)
{
    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(BG_0, 0x0000);
    SetBackgroundTileDataOffset(BG_1, 0x0000);
    SetBackgroundTileDataOffset(BG_2, 0x4000);
    SetBackgroundTileDataOffset(BG_3, 0x4000);

    SetBackgroundMapDataOffset(BG_0, 0xD800);
    SetBackgroundMapDataOffset(BG_1, 0xE000);
    SetBackgroundMapDataOffset(BG_2, 0xE800);
    SetBackgroundMapDataOffset(BG_3, 0xF800);

    SetBackgroundScreenSize(BG_0, 0);
    SetBackgroundScreenSize(BG_1, 0);
    SetBackgroundScreenSize(BG_2, 0);
    SetBackgroundScreenSize(BG_3, 0);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(0, 0, 0, 0, 0);
    SetWinEnable(0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetBlendConfig(1, 8, 8, 8);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    proc->timer = 0;
    proc->unk38 = 0;
    proc->unk3A = 0;
    proc->unk3C = 0;
    proc->unk46 = 0;
    proc->unk3E = 0;
}
