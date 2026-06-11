#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"


















extern struct PopupInstruction CONST_DATA PopupScr_GoldWasStole[];







extern struct PopupInstruction CONST_DATA PopupScr_WRankUp[];



void StartBrownTextBoxCore(int x, int y, int textId, int chr, int pal, ProcPtr parent)
{
    struct Font font;
    struct Text text;

    int r6 = 0;
    int r4;

    struct BrownTextBoxProc * proc = Proc_Start(ProcScr_BrownTextBox, parent);
    const char * str = GetStringFromIndex(textId);

    proc->x = x;
    proc->y = y;
    proc->chr = chr;
    proc->pal = pal;
    proc->textId = textId;
    proc->oam0Attr = 0;

    ApplyPalette(gPal_BrownTextBox, (proc->pal + 0x10));
    ApplyPalette(Pal_Text, (proc->pal + 0x11));
    Decompress(gGfx_BrownTextBox, (void *)(0x06010000 + proc->chr));

    r6 = GetStringTextLen(str);

    r4 = r6 / 8;
    r6 = r4 + 5;

    proc->width = r6;

    InitSpriteTextFont(&font, (void *)(proc->chr + 0x06010400), proc->pal + 0x12);
    SetTextFont(&font);
    InitSpriteText(&text);
    SpriteText_DrawBackgroundExt(&text, 0);
    SetTextFontGlyphs(0);

    Text_InsertDrawString(&text, GetStringTextCenteredPos((r4 + 3) * 8, str), 0, str);

    SetTextFont(NULL);
}

void StartBrownTextBox(int textId, s16 x, s16 y, ProcPtr parent)
{
    StartBrownTextBoxCore(x, y, textId, 0x5000, 9, parent);
    Proc_StartBlocking(ProcScr_Popup_0, parent);
}
