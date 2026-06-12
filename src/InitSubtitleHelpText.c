#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void InitSubtitleHelpText(struct SubtitleHelpProc * proc)
{
    const char * iter;
    int line;
    int width;

    iter = proc->string;

    InitSpriteTextFont(&proc->font, OBJ_VRAM0 + 0x4800, 0x14);
    SetTextFontGlyphs(1);

    ApplyPalette(Pal_TalkText, 0x14);

    for (line = 0; line < 2; line++) {
        InitSpriteText(proc->text + line);

        SpriteText_DrawBackgroundExt(proc->text + line, 0);
        Text_SetColor(proc->text + line, 0);
    }

    line = 0;

    if (iter != 0) {
        while (*iter > 1) {

            iter = Text_DrawCharacter(proc->text + line, iter);

            if (Text_GetCursor(proc->text + line) > 0xE0) {

                iter -= 2;
                line++;

                GetCharTextLen(iter, &width);

                Text_SetCursor(proc->text + line, (Text_GetCursor(proc->text) - width) - 0xC0);
            }
        }

        proc->textCount = ((GetStringTextLen(proc->string) + 16) >> 5) + 1;
        proc->textNum = proc->textCount - 1;
    }

    SetTextFont(0);

    return;
}
