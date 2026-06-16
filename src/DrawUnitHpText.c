#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "unitinfowindow.h"
#include "functions.h"

// JP region-different msgids 0x4E9->0x478, 0x539->0x4C9
void DrawUnitHpText(struct Text* text, struct Unit* unit) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x478));
    Text_InsertDrawString(text, 40, 3, GetStringFromIndex(0x4C9));

    Text_InsertDrawNumberOrBlank(text, 32, 2, GetUnitCurrentHp(unit));
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitMaxHp(unit));

    return;
}
