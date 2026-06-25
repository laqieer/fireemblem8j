#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

extern u8 Img_OpAnimFaceMontageBG[];
extern u8 Tsa_OpAnimFaceMontageBG[];

//! FE8U = 0x080C8C04
void OpAnimFaceMontageBegin(struct ProcOpAnim * proc)
{
    int ret;
    int i;

    i = DivRem(proc->unk3E, 0x4c);
    i = Interpolate(INTERPOLATE_LINEAR, 0, 0x1a, i, 0x4c);

    if (i < 0xd)
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, i, 0x10, 8);
    }
    else
    {
        SetBlendConfig(BLEND_EFFECT_ALPHA, 0x19 - i, 0x10, 8);
    }

    proc->unk3E++;

    CopyToPalOpAnim(pal_OpanimGfx_0, 0, 0x100);

    ret = Interpolate(INTERPOLATE_LINEAR, 0xc, 0, proc->timer, 0x26);

    for (i = 0; i < 8; i++)
    {
        BlendPaletteToColor(gPaletteBuffer + i * 0x10, 0, ret);
    }

    switch (proc->timer)
    {
        case 1:
            Decompress(Img_OpAnimFaceMontageBG, (void *)(GetBackgroundTileDataOffset(3) + 0x06002000));
            Decompress(Tsa_OpAnimFaceMontageBG, gBG3TilemapBuffer);

            for (i = 0; i < 0x280; i++)
            {
                gBG3TilemapBuffer[i] = gBG3TilemapBuffer[i] + 0xe100;
            }

            BG_EnableSyncByMask(BG3_SYNC_BIT);

            break;

        case 2:
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x220, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x260, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x2a0, 0x20);
            CopyToPalOpAnim(Pal_OpanimGfx_0, 0x2e0, 0x20);

            break;

        case 3:
            Decompress(Img_OpAnimFaceRennac, (void *)0x06010000);
            CopyToPalOpAnim(Pal_OpAnimFaceRennac, 0x200, 0x20);
            Decompress(Img_OpAnimFaceRennacShadow, (void *)0x06010F00);

            break;

        case 4:
            Decompress(Img_OpAnimFaceLArachel, (void *)0x06011E00);
            CopyToPalOpAnim(Pal_OpAnimFaceLArachel, 0x240, 0x20);
            Decompress(Img_OpAnimFaceLArachelShadow, (void *)0x06012D00);

            break;

        case 5:
            Decompress(Img_OpAnimFaceDozla, (void *)0x06013C00);
            CopyToPalOpAnim(Pal_OpAnimFaceDozla, 0x280, 0x20);
            Decompress(Img_OpAnimFaceDozlaShadow, (void *)0x06014B00);

            break;
    }

    if (proc->timer == 0x26)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
