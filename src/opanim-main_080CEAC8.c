#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

//! FE8U = 0x080C9AFC
void OpAnimFadeToWhite(struct ProcOpAnim * proc)
{
    int i;

    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x30);

    CopyToPalOpAnim(pal_OpanimGfx_0, 0, 0x100);

    for (i = 0; i < 8; i++)
    {
        BlendPaletteToColor(gPaletteBuffer + i * 0x10, 0x7FFF, ret);
    }

    if (proc->timer == 0x30)
    {
        gOpAnimSt.pal = 0x7FFF;
        proc->timer = 0;
        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C9B6C
void OpAnimConfigCharacterScrollBg(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(1, 1, 0, 1, 1);

    SetBackgroundTileDataOffset(BG_1, 0);
    SetBackgroundMapDataOffset(BG_1, 0xe000);

    return;
}

//! FE8U = 0x080C9C08
void OpAnimSetupJoshuaScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimJoshua, 0, 0x160);

    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0x118;
    proc->unk42 = 0xe8;
    proc->unk40 = 0xe8;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9C5C
void OpAnimSetupLArachelScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimLArachel, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xc0;
    proc->unk42 = 0x140;
    proc->unk40 = 0x108;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9CAC
void OpAnimSetupSethScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimSeth, 0, 0x160);

    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xc0;
    proc->unk42 = 0x140;
    proc->unk40 = 0x118;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9CFC
void OpAnimSetupMyrrhScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimMyrrh, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0x110;
    proc->unk42 = 0xf0;
    proc->unk40 = 0x108;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9D4C
void OpAnimSetupSalehScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimSaleh, 0, 0x160);
    proc->unk47 = 1;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 0xe8;
    proc->unk42 = 0x118;
    proc->unk40 = 0xe8;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9DA0
void OpAnimSetupTethysScroll(struct ProcOpAnim * proc)
{
    OpAnimConfigCharacterScrollBg();
    CopyToPalOpAnim(Pal_OpAnimTethys, 0, 0x160);

    proc->unk47 = 0;
    proc->unk48 = (u16 *)gGenericBuffer;
    proc->unk4C = (u16 *)(gGenericBuffer + 0x800);
    proc->unk44 = 200;
    proc->unk42 = 0x138;
    proc->unk40 = 0x128;
    proc->unk30 = 0;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x080C9DF0
void OpAnimCharacterScrollInBegin(void)
{
    SetBlendConfig(BLEND_EFFECT_ALPHA, 0x10, 0, 8);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    SetDispEnable(1, 1, 1, 1, 1);

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    return;
}
