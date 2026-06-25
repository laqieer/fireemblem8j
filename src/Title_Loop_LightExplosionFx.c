#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "proc.h"

extern u16 CONST_DATA gSprite_Title_SacredStonesBanner[];
extern u16 CONST_DATA gSprite_Title_Subtitle[];

void Nop_Titlescreen_0(int a, int b);
void DrawTitleLightBubbleSprites(int arg);

//! JP = 0x080CB114 (Title_Loop_LightExplosionFx, region-different)
void Title_Loop_LightExplosionFx(struct TitleScreenProc * proc)
{
    int res;

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 16, 0, proc->timer, 24);

    res = Interpolate(0, 16, 0, proc->timer, 24);

    ApplyPalette(gPal_TitleMainBackground, 0xE);
    BlendPaletteToColor(PAL_BG(0xe), 0x7FFF, res);

    ApplyPalette(gPal_TitleDragonForeground, 0xF);
    BlendPaletteToColor(PAL_BG(0xf), 0x7FFF, res);

    res = Interpolate(0, 0, 63, proc->timer, 24);
    Nop_Titlescreen_0(res, proc->unk_30);
    proc->unk_30 = res;

    PutSpriteExt(1, 56, 87, gSprite_Title_SacredStonesBanner, 0x3230);

    if (proc->timer > 0x16)
        PutSpriteExt(1, 52, 26, gSprite_Title_Subtitle, 0x8300);
    else if (proc->timer > 0x14)
        PutSpriteExt(1, 52, 26, gSprite_Title_Subtitle, 0x82C0);

    DrawTitleLightBubbleSprites(proc->timer);

    if (proc->timer == 24)
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
