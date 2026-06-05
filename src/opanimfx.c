#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "gamecontrol.h"
#include "opanim.h"



























void OpAnimfxTerminatorMain(struct Proc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        SetNextGameActionId(GAME_ACTION_USR_SKIPPED);
        gOpAnimSt.pal = 0;
        Proc_Goto(proc->proc_parent, 99);
    }
}

void NewOpAnimfxTerminator(ProcPtr parent)
{
    Proc_Start(ProcScr_OpAnimfxTerminator, parent);
}

void EndOpAnimfxTerminator(void)
{
    Proc_End(Proc_Find(ProcScr_OpAnimfxTerminator));
}

void CopyToPalOpAnim(const void * src, int offset, int size)
{
    CopyToPaletteBuffer(src, offset, size);
    gPaletteBuffer[0] = gOpAnimSt.pal;
}

void CopyFirstPalDirectly(const u16 * src, u16 * dst)
{
    int i;
    for (i = 0; i < 20; i++)
        dst[i * 0x20] = src[i * 0x20];
}

void SetFirstPalDirectly(u16 * src, u16 * dst, u8 pal)
{
    int i;
    for (i = 0; i < 20; i++)
    {
        *dst = (*src & 0x7FFF) | (pal << 0xC);
        src += 0x20;
        dst += 0x20;
    }
}

void ClearFirstPalDirectly(u16 * dst)
{
    int oam2 = 0;
    int i = 0x13;
    do {
        *dst = oam2;
        dst += OAM2_CHR(0x400 / 0x20);
    } while (--i >= 0);
}
