#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

void OpAnimPreparefxEphraim(struct ProcOpAnim * proc)
{
    int i;
    u16 * dst;

    switch (proc->timer) {
    case 0:
        Decompress(Img_OpAnimCharacterBG, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_3));
        Decompress(Tsa_OpAnimCharacterBG, gBG3TilemapBuffer);

        for (i = 1; i < 0x10; ++i)
            gPaletteBuffer[0xe0 + i] = RGB_WHITE;

        for (i = 0; i < 0x280; ++i)
            gBG3TilemapBuffer[i] += 0xe100;

        BG_EnableSyncByMask(BG3_SYNC_BIT);
        break;

    case 1:
        Decompress(Img_OpAnimEphraimClose1, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_0));
        Decompress(Tsa_OpAnimEphraimClose1, gGenericBuffer);
        break;

    case 2:
        Decompress(Img_OpAnimEphraimClose2, (void *)BG_VRAM + 0x2000 + GetBackgroundTileDataOffset(BG_0));
        Decompress(Tsa_OpAnimEphraimClose2, gGenericBuffer + 0x800);
        break;

    case 3:
        Decompress(Img_OpAnimEphraim, (void *)BG_VRAM + GetBackgroundTileDataOffset(BG_2));
        Decompress(Tsa_OpAnimEphraim, gGenericBuffer + 0x1000);
        ApplyPalettesOpAnim(Pal_OpAnimEphraimBlur, 0, 11);
        break;

    case 4:
        Decompress(Img_OpAnimEphraimBlur3, (void *)BG_VRAM + 0x8000);
        Decompress(Tsa_OpAnimEphraimBlur3, (void *)BG_VRAM + 0xC000);
        break;

    case 5:
    {
        Decompress(Img_OpAnimEphraimBlur2, (void *)BG_VRAM + 0xA000);
        Decompress(Tsa_OpAnimEphraimBlur2, (void *)BG_VRAM + 0xC800);

        dst = (void *)BG_VRAM + 0xC800;
        for (i = 0; i < 0x280; ++i)
            dst[i] += 0x100;

        break;
    }
    case 6:
    {
        for (i = 1; i < 0x10; ++i)
            gPaletteBuffer[0xf0 + i] = RGB_BLACK;

        CpuFastCopy((u16 *)(gGenericBuffer + 0x1000), (u16 *)(gGenericBuffer + 0x1000) + 0x800 / 2, 0x800);
        dst = (u16 *)(gGenericBuffer + 0x1000) + 0x400;
        for (i = 0; i < 0x280; ++i)
            dst[i] = (dst[i] & 0xFFF) | 0xF000;

        CpuFastCopy(dst, (void *)BG_VRAM + 0xF000, 0x500);
        EnablePaletteSync();
        SetDispEnable(0, 1, 1, 1, 1);

        proc->timer = 0;
        proc->unk30 = 0;
        proc->unk32 = 0;

        gOpAnimSt.x = 0;
        gOpAnimSt.y = 0;
        gOpAnimSt.unk04 = 0;
        gOpAnimSt.unk06 = 0xA0;
        gOpAnimSt.pal = 0;
        SetBackgroundTileDataOffset(BG_2, 0x8000);
        Proc_Break(proc);
        return;
    }
    default:
        break;
    }
    proc->timer++;
}

void OpAnimMergeBGProcInit(struct Proc08AA7034 * proc)
{
    proc->timer = 0;
}

void OpAnimMergeBGProcUpdateBgPalette(struct Proc08AA7034 * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x20);
    ApplyPaletteOpAnim(Pal_OpAnimCharacterBG, 14);
    BlendPaletteToColor(PAL_BG(14), 0x7FFF, ret);

    if (proc->timer == 0x20)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }
    proc->timer++;
}

void OpAnimDrawSplitLine(int xOam1, int yOam0)
{
    int i;
    for (i = 0; i < 8; i++)
        PutSpriteExt(0, i << 5, yOam0, gObject_32x8,
            OAM2_PAL(0) + OAM2_LAYER(0) + OAM2_CHR(0x80 / 0x20));

    for (i = 0; i < 8; i++)
        PutSpriteExt(0, xOam1, i << 5, gObject_8x32,
            OAM2_PAL(0) + OAM2_LAYER(0) + OAM2_CHR(0x0 / 0x20));
}

void OpAnimEphraimfxFlyIn(struct ProcOpAnim * proc)
{
    int val, ret;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->timer <= 0x10)
    {
        ret = Interpolate(4, 0, 0x80, proc->timer, 0x10);
        switch (proc->timer) {
        case 12:
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)BG_VRAM + 0xC800, NULL, 0);
            break;

        case 13:
            Decompress(Img_OpAnimEphraimBlur1, (void *)BG_VRAM + 0x8000);
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC800, NULL, 0);
            break;

        case 14:
            Decompress(Tsa_OpAnimEphraimBlur1, (void *)BG_VRAM + 0xC000);
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 15:
        default:
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)BG_VRAM + 0xC000, NULL, 0);
            break;

        case 16:
            TsaModifyFirstPalMaybe(ret, 0, 0x88, BG_2, (void *)(gGenericBuffer + 0x1000), NULL, 0);
            SetBackgroundTileDataOffset(BG_2, 0x4000);
            Proc_Start(ProcScr_OpAnimMergeBG, proc);
            break;
        }
        proc->unk30 = ret;
    }

    val = (proc->timer - 5);
    if (val >= 0)
    {
        ret = Interpolate(4, 0, 0x90, val, 0x10);
        TsaModifyFirstPalReverse(ret, proc->unk32, 0xC8, BG_1, (u16 *)(gGenericBuffer), (u16 *)(gGenericBuffer + 0x800), 1);
        proc->unk32 = ret;

        if (val == 0x10)
        {
            TsaModifyFirstPalReverse(proc->unk32, 0, 0xC8, BG_0, (u16 *)(gGenericBuffer), (u16 *)(gGenericBuffer + 0x800), 0);
            proc->timer = 0;
            Proc_Break(proc);
            return;
        }
    }
    proc->timer++;
}
