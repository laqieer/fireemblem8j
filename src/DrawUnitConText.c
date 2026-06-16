#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"

void DrawUnitConText(struct Text* text, struct Unit* unit) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x486)); // JP msgid (US uses 0x4f7)
    Text_InsertDrawNumberOrBlank(text, 56, 2, UNIT_CON(unit));

    return;
}
