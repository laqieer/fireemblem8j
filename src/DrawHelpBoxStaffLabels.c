#include "global.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "helpbox.h"
#include "functions.h"

// JP region-different msgids (0x509->0x498, 0x500->0x48F) + positions (30->12, 48->36, 70->56)
int DrawHelpBoxStaffLabels(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, GetStringFromIndex(0x498));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 12, 7, GetItemDisplayRankString(item));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 36, 8, GetStringFromIndex(0x48F));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 56, 7, GetItemDisplayRangeString(item));
    return 1;
}
