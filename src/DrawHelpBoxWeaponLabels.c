#include "global.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "helpbox.h"
#include "functions.h"

// JP region-different msgids (0x500/502/503/4F4/501 -> 0x48F/491/492/483/490) + rng x47->38
int DrawHelpBoxWeaponLabels(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, GetWeaponTypeDisplayString(GetItemType(item)));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 38, 8, GetStringFromIndex(0x48F));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 97, 8, GetStringFromIndex(0x491));

    Text_InsertDrawString(&gHelpBoxSt.text[1], 0, 8, GetStringFromIndex(0x492));
    Text_InsertDrawString(&gHelpBoxSt.text[1], 47, 8, GetStringFromIndex(0x483));
    Text_InsertDrawString(&gHelpBoxSt.text[1], 97, 8, GetStringFromIndex(0x490));

    return 2;
}
