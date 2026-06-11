#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

void OpAnimAllBlack(struct ProcOpAnimFadeIn * proc)
{
    gLCDControlBuffer.bldcnt.effect = 0x2;
    gLCDControlBuffer.blendY = 0;
    SetBlendTargetA(1, 1, 1, 1, 1);
    proc->cur = 0;
}

void OpAnimFadeInMain(struct ProcOpAnimFadeIn * proc)
{
    gLCDControlBuffer.blendY = Interpolate(
        INTERPOLATE_LINEAR,
        0, 0x10,
        proc->cur,
        proc->max);

    if (proc->cur == proc->max)
        Proc_Break(proc);

    proc->cur++;
}

void NewProcOpAnimFadeIn(int max, ProcPtr parent)
{
    struct ProcOpAnimFadeIn * proc;
    proc = Proc_Start(ProcScr_OpAnimFadeIn, parent);
    proc->max = max;
}

void BgAffineSetOpAnim(int scaling_radio, int angle)
{
    struct BgAffineSrcData data;
    data.texX = 0x10000;
    data.texY = 0x10000;
    data.scrX = 0x78;
    data.scrY = 0x50;
    data.sx = scaling_radio;
    data.sy = scaling_radio;
    data.alpha = angle << 8;

    BgAffineSet(&data, &gLCDControlBuffer.bg2affin, 1);
}

void SetupOpAnimWorldMapfx(struct ProcOpAnim * proc)
{
    int i;
    u16 * vram;

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundTileDataOffset(BG_0, 0x0000);
    SetBackgroundTileDataOffset(BG_1, 0x4000);
    SetBackgroundTileDataOffset(BG_2, 0x8000);
    SetBackgroundTileDataOffset(BG_3, 0x0000);

    SetBackgroundMapDataOffset(BG_0, 0xD800);
    SetBackgroundMapDataOffset(BG_1, 0xE800);
    SetBackgroundMapDataOffset(BG_2, 0xF000);
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

    SetWinEnable(0, 0, 0);

    Decompress(Img_OpAnimWorldMap, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
    Decompress(Tsa_OpAnimWorldMap, (void *)BG_VRAM + 0xF000);
    CpuFastFill16(0, gPaletteBuffer, 0x20);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    Decompress(Img_OpAnimWorldMapFog, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_1));
    ApplyPaletteOpAnim(Pal_OpAnimWorldMapFog, 2);

    vram = (void *)BG_VRAM + 0xE800;
    Decompress(Tsa_OpAnimWorldMapFog, vram);

    for (i = 0; i < 0x400;)
    {
        *vram += 0x2000;
        i = i + 1;
        vram = vram + 1;
    }

    EnablePaletteSync();
    SetBlendConfig(0x1, 0x0, 0x10, 0x8);
    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(1, 1, 1, 1, 0);

    proc->timer = 0;
    proc->unk34 = 0;
    proc->unk36 = 0;

    SetDispEnable(0, 0, 1, 0, 1);
    StartBgmExt(0x1, 0, NULL);
}
