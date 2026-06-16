#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"

void DrawUnitStatusText(struct Text* text, struct Unit* unit) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x489)); // JP msgid (US 0x4fa)
    Text_InsertDrawString(text, 32, 2, GetUnitStatusName(unit)); // JP x=32 (US 24)

    return;
}
