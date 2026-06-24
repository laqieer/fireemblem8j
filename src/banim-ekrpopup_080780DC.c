#include "global.h"
#include "hardware.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "icon.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ctc.h"

/* DrawBattlePopup @ JP 0x080780DC (fe8u banim-ekrpopup.c:131), region-different.
 *
 * JP text-layout divergences vs fe8u, decoded from the asm pool literals:
 *   - msgids: type0 = 0x800/0x801, type1 name + 0x802, type2 = 0x80B
 *     (fe8u used 0x01/0x02, name + 0x03, 0x0D).
 *   - type1 uses the 1-arg GetItemName(item) (JP 0x0801729C), NOT the 2-arg
 *     GetItemNameWithArticle(item, 1) that fe8u uses.
 *   - palette upload is CpuFastSet(Pal_EkrPopup, PAL_BG(1), 8) — JP's EWRAM
 *     palette buffer (gPaletteBuffer+0x20 == 0x020228C8) — not CpuFastCopy.
 *   - the draw pass leads each non-first string with Text_Skip(0x10), and the
 *     width3 for type1 has no +0x04, and width5 gets NO type1/type2 adjustment.
 *   - SetWinEnable(0,0,0) is inlined (the &gLCDControlBuffer.dispcnt masks).
 * Anim script is the JP AnimScr_EkrPopup @ ROM 0x087E1A70 (bound data alias). */

extern const void* AnimScr_EkrPopup;

void DrawBattlePopup(struct ProcEkrPopup* proc, int type, u32 priv)
{
    const char* str;
    int width1, width2, width3, width_popupbox, width5, xcursor;

    struct Text* text;
    struct Anim* anim;

    LZ77UnCompVram(Img_EkrPopup, (void*)(BG_VRAM + 0x2000));
    LZ77UnCompWram(Tsa_EkrPopup, gEkrTsaBuffer);
    InitTextFont(&gBanimFont, (void*)(BG_VRAM + 0x2100), 0x108, 1);
    SetTextDrawNoClear();
    CpuFastSet(Pal_EkrPopup, PAL_BG(0x1), 8);

    if (type == 0)
    {
        str = GetStringFromIndex(0x800);
        width1 = GetStringTextLen(str);
        width2 = width1 + 0x10;

        str = GetStringFromIndex(0x801);
        width3 = GetStringTextLen(str) + width2;
    }
    else if (type == 1)
    {
        width1 = 0;
        str = GetItemName(priv);
        width2 = GetStringTextLen(str) + 0x10;

        str = GetStringFromIndex(0x802);
        width3 = GetStringTextLen(str) + width2;
    }
    else
    {
        width1 = 0;
        width2 = 0x10;

        str = GetStringFromIndex(0x80B);
        width3 = GetStringTextLen(str) + 0x10;
    }

    width_popupbox = (width3 + 7) >> 3;
    MakeBattlePopupTileMapFromTSA(gBG1TilemapBuffer, width_popupbox);

    text = &gBanimText[0];
    InitText(text, width_popupbox);
    xcursor = (width_popupbox * 8 - width3) >> 1;
    Text_SetCursor(text, xcursor);
    LZ77UnCompVram(gBanimmisc_12, (void*)(BG_VRAM + 0x2100));

    if (type == 0)
    {
        str = GetStringFromIndex(0x800);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);

        Text_Skip(text, 0x10);

        str = GetStringFromIndex(0x801);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }
    else if (type == 1)
    {
        Text_Skip(text, 0x10);

        str = GetItemName(priv);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_GRAY);
        Text_DrawString(text, str);

        str = GetStringFromIndex(0x802);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }
    else
    {
        Text_Skip(text, 0x10);

        str = GetStringFromIndex(0x80B);
        Text_SetColor(text, TEXT_COLOR_SYSTEM_WHITE);
        Text_DrawString(text, str);
    }

    width5 = (0xE0 - (width_popupbox + 2) * 8) >> 1;
    BG_SetPosition(BG_1, -width5, 0xFFD0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    ResetIconGraphics_();

    if (type == 0)
    {
        LoadIconPalette(1, 0x12);
        LoadIconObjectGraphics(GetItemType(priv) + 0x70, 0x40);
    }
    else if (type == 1)
    {
        LoadIconPalette(0, 0x12);
        LoadIconObjectGraphics(GetItemIconId(priv), 0x40);
    }
    else
    {
        LoadIconPalette(1, 0x12);
        LoadIconObjectGraphics(priv + 0x70, 0x40);
    }

    anim = AnimCreate(&AnimScr_EkrPopup, 0x96);
    proc->anim = anim;
    anim->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x1) + OAM2_CHR(0x0800 / 0x20);
    {
        int xtmp = xcursor + 0x10;
        anim->xPosition = width5 + xtmp + width1;
    }
    anim->yPosition = 0x38;

    EnablePaletteSync();
    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}
