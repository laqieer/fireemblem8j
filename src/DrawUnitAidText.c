#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"

void DrawUnitAidText(struct Text* text, struct Unit* unit) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x487)); // JP msgid (US uses 0x4f8)
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitAid(unit));

    return;
}
