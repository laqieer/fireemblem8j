#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

EWRAM_DATA struct CgTextSt gCgTextSt = { 0 };

// clang-format off





// clang-format on

//! FE8U = 0x0808E9D8
void SetCgTextFlags(int flags)
{
    gCgTextSt.flags = flags;
    return;
}

//! FE8U = 0x0808E9F0
void SetCgTextFlag(int flag)
{
    gCgTextSt.flags |= flag & 0x3FFFFF;
    return;
}

//! FE8U = 0x0808EA1C
void ClearCgTextFlag(int flag)
{
    SetCgTextFlags(GetCgTextFlags() & (flag ^ 0x3FFFFF));
    return;
}

//! FE8U = 0x0808EA3C
u32 GetCgTextFlags(void)
{
    return gCgTextSt.flags;
}

//! FE8U = 0x0808EA48
void SetCgTextBlendControl(u16 target1, u16 target2)
{
    target2 |= 0x20;
    gCgTextSt.bldCnt = target1 + BLDCNT_EFFECT_BLEND + (target2 << 8);
    return;
}

//! FE8U = 0x0808EA68
u16 GetCgTextBlendControl(void)
{
    return gCgTextSt.bldCnt;
}

//! FE8U = 0x0808EA74
void SetCgTextBlendAlpha(u16 target1, u16 target2)
{
    gCgTextSt.bldAlpha = target1 + (target2 << 8);
    return;
}

//! FE8U = 0x0808EA8C
u16 GetCgTextBlendAlpha(void)
{
    return gCgTextSt.bldAlpha;
}

//! FE8U = 0x0808EA98
void CgText_OnHBlank(void)
{
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > DISPLAY_HEIGHT)
    {
        vcount = 0;
    }

    if (vcount == gCgTextSt.unk_48_00 * 8 - 32)
    {
        REG_BLDCNT = GetCgTextBlendControl();
        REG_BLDALPHA = GetCgTextBlendAlpha();
    }

    if ((vcount == 0) || (vcount == (gCgTextSt.unk_48_05 * 8 + 4)))
    {
        REG_BLDCNT = *((u16 *)&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = gLCDControlBuffer.blendCoeffA + gLCDControlBuffer.blendCoeffB * 0x100;
    }

    return;
}

//! FE8U = 0x0808EB0C
void CgText_DrawNameBox(struct CgTextMainProc * proc)
{
    struct Font font;
    struct Text th;
    char buf[32];

    char * iter = buf;

    if ((proc->str[0] == 0x80) && (proc->str[1] == 0x23)) // [SetName]
    {
        proc->str += 2;

        while (*proc->str != 0x01) // [NL]
        {
            iter[0] = proc->str[0];
            iter[1] = proc->str[1];
            proc->str += 2;
            iter += 2;
        }

        proc->str++;
        *iter = 0;

        SetCgTextFlag(CG_TEXT_FLAG_16);

        InitSpriteTextFont(&font, (void *)0x06017800, 0x12);
        SetTextFont(&font);
        InitSpriteText(&th);

        SpriteText_DrawBackgroundExt(&th, 0);

        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
        Text_InsertDrawString(&th, GetStringTextCenteredPos(48, buf), 0, buf);

        SetTextFont(NULL);

        ApplyPalette(Pal_Text, 0x12);
        ApplyPalette(gParticlesFx_7, 0x11);
        Decompress(gParticlesFx_6, (void *)0x06017900);
    }

    return;
}

//! FE8U = 0x0808EBD4
void CgText_Init(struct CgTextMainProc * proc)
{
    int i;
    int x;
    int y;

    int width = 0;
    int height = 0;

    proc->pauseTimer = 0;
    proc->blendAmt = 0;

    if (GetCgTextFlags() >> 0xb & 7)
    {
        proc->displaySpeed = ((GetCgTextFlags() >> 0xb) & 7) - 1;
    }
    else
    {
        proc->displaySpeed = GetTextDisplaySpeed();
    }

    proc->numCharsVisible = (proc->displaySpeed != 0) ? 1 : INT8_MAX;

    proc->thIndex = 0;
    proc->unk_5e = 0;

    CgText_DrawNameBox(proc);

    if ((proc->boxWidth < 0) || (proc->boxHeight < 0))
    {
        int r1;

        SetTextFontGlyphs(TEXT_GLYPHS_TALK);
        GetCgTextBoxDimensions(proc->str, &width, &height);
        SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

        r1 = width + 7;
        proc->boxWidth = r1 / 8;
        proc->boxHeight = height / 8;
    }

    if (!(GetCgTextFlags() & CG_TEXT_FLAG_0))
    {
        y = proc->y + ~proc->boxHeight;
        if (GetCgTextFlags() & CG_TEXT_FLAG_1)
        {
            x = (proc->x - proc->boxWidth) - 2;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), (proc->x - proc->boxWidth) - 2, proc->y + ~proc->boxHeight,
                proc->boxWidth + 2, proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 3;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x - 1, proc->y - 2, kind);
            }
        }
        else
        {
            x = (proc->x) + 1;
            PutTalkBubbleTm(
                GetCgTextBg(GetCgTextFlags()), (proc->x) + 1, proc->y + ~proc->boxHeight, proc->boxWidth + 2,
                proc->boxHeight + 2);

            if (!(GetCgTextFlags() & CG_TEXT_FLAG_10))
            {
                int kind = (GetCgTextFlags() & CG_TEXT_FLAG_18) ? 5 : 2;
                PutTalkBubbleTail(GetCgTextBg(GetCgTextFlags()), proc->x, proc->y - 2, kind);
            }
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
        {
            u16 * bg = BG_GetMapBuffer(GetCgTextBg(GetCgTextFlags()));
            TileMap_FillRect(bg + y * 0x20 + x, 6, 0, 0);
        }

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
    }

    CgText_AdjustBoxPosition(proc);
    StartParallelWorker(CgText_Display, proc);

    SetTextFont(proc->pFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    for (i = 0; i <= proc->boxHeight / 2; i++)
    {
        InitSpriteText(proc->pTexts[i]);
        Text_SetColor(proc->pTexts[i], 0xb);
    }

    CgText_ClearSpriteText(proc);
    SetTextFont(NULL);

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        if (GetCgTextFlags() & CG_TEXT_FLAG_7)
        {
            SetCgTextBlendAlpha(0x10, 1);
            Proc_Goto(proc, 3);
        }
        else
        {
            SetCgTextBlendAlpha(0, 0x10);
        }

        if (GetCgTextFlags() & CG_TEXT_FLAG_16)
        {
            gCgTextSt.unk_48_00 = proc->y - 5;
        }
        else
        {
            gCgTextSt.unk_48_00 = proc->y - 1;
        }

        gCgTextSt.unk_48_05 = proc->boxHeight + proc->y + 1;

        SetCgTextBlendControl(1 << GetCgTextBg(GetCgTextFlags()), 1 << GetCgTextBg(GetCgTextFlags()) ^ 0x1f);

        if (!(GetCgTextFlags() & CG_TEXT_FLAG_19))
        {
            SetSecondaryHBlankHandler(NULL);
            SetSecondaryHBlankHandler(CgText_OnHBlank);
        }
    }

    BG_SetPosition(GetCgTextBg(GetCgTextFlags()), 0, 0);

    return;
}

//! FE8U = 0x0808EF64
void CgText_InitBlendAmt(struct CgTextMainProc * proc)
{
    proc->blendAmt = 0;
    return;
}

//! FE8U = 0x0808EF6C
void CgText_LoopFadeIn(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt++;

    target1 = proc->blendAmt;

    if (proc->blendAmt != 0x10)
    {
        target2 = 0x10 - proc->blendAmt;
    }
    else
    {
        target2 = 1;
    }

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808EFA8
void CgText_InitFadeOut(struct CgTextMainProc * proc)
{
    CgText_ClearSpriteText(proc);
    SetFaceDisplayBitsById(0, GetFaceDisplayBitsById(0) & ~FACE_DISP_TALK_1);

    EndCgTextInterpreter();

    if (GetCgTextFlags() & CG_TEXT_FLAG_0)
    {
        Proc_Goto(proc, 5);
    }
    else
    {
        proc->blendAmt = 0x10;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_17)
    {
        StartFaceFadeOut(Proc_Find(gProcScr_E_FACE));
    }

    return;
}

//! FE8U = 0x0808F008
void CgText_LoopFadeOut(struct CgTextMainProc * proc)
{
    u16 target1;
    u16 target2;

    proc->blendAmt--;

    target1 = proc->blendAmt;

    if (target1 != 0x10)
    {
        target2 = 0x10 - target1;
    }
    else
    {
        target2 = 1;
    }

    SetCgTextBlendAlpha(target1, target2);

    if (proc->blendAmt == 0)
    {
        ClearCgTextFlag(CG_TEXT_FLAG_16);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808F04C
void CgText_0(struct CgTextMainProc * proc)
{
    if (!(gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON)))
    {
        return;
    }

    if (GetCgTextFlags() & CG_TEXT_FLAG_6)
    {
        return;
    }

    SetDialogueSkipEvBit();
    EndCgTextInterpreter();

    Proc_Goto(proc, 0);

    return;
}
