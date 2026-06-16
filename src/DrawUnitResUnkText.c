#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"

void DrawUnitResUnkText(struct Text* text, struct Unit* unit, int unused) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x47f)); // JP msgid (US uses 0x4f0)
    Text_InsertDrawNumberOrBlank(text, 56, 2, GetUnitResistance(unit));

    return;
}
