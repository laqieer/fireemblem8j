#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"

void DrawUnitResChangeText(struct Text* text, struct Unit* unit, int bonus) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x47f)); // JP msgid (US 0x4f0)
    Text_InsertDrawString(text, 40, 3, GetStringFromIndex(0x4ca)); // JP msgid (US 0x53a)

    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitResistance(unit) + bonus);
    Text_InsertDrawNumberOrBlank(text, 32, 2, GetUnitResistance(unit));

    return;
}
