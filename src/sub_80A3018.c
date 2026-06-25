#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "functions.h"
#include "prepscreen.h"

extern u32 gPrepItemTextMsgIds[];

void sub_80A3018(void)
{
    int i;
    int offset;
    struct Text *th;
    u32 *src;
    char *str;

    th = gPrepItemTexts;

    SetTextFontGlyphs(0);
    SetTextFont(0);

    i = 0;
    offset = 0x80;
    src = gPrepItemTextMsgIds;

    /* *(&i) keeps i address-taken so agbcc -O2 does not reverse the loop into a
       down-counter, matching the JP build's up-counting `cmp r6, #4; ble`. */
    for (; *(&i) <= 4; i++)
    {
        ClearText(th);
        str = GetStringFromIndex(*src++);
        PutDrawText(th++, (u16 *)((u8 *)(gBG2TilemapBuffer + 4) + offset), 0, 0, 0, str);
        offset += 0x80;
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
