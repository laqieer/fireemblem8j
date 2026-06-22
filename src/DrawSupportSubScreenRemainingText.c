#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "uisupport.h"

void DrawSupportSubScreenRemainingText(struct SubScreenProc* proc) {
    const char* str;
    struct Font font;
    struct Text th;

    InitSpriteTextFont(&font, (void*)0x06015000, 0xe);
    ApplyPalette(Pal_Text, 0x1E);

    InitSpriteText(&th);

    SetTextFont(&font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&th, 0);

    str = GetStringFromIndex(gCharacterData[GetSupportScreenCharIdAt(proc->unitIdx) - 1].nameTextId);

    Text_InsertDrawString(
        &th,
        GetStringTextCenteredPos(40, str),
        TEXT_COLOR_SYSTEM_WHITE,
        str
    );

    Text_InsertDrawString(
        &th,
        48,
        proc->remainingSupports == 0 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x536)
    );

    Text_SetCursor(&th, 96);

    Text_SetColor(&th, (proc->remainingSupports == 0) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumberOrBlank(&th, proc->remainingSupports);

    Text_InsertDrawString(
        &th,
        104,
        proc->remainingSupports == 0 ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE,
        GetStringFromIndex(0x537)
    );

    SetTextFont(0);

    return;
}
