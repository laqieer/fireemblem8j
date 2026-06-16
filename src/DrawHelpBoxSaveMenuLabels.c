#include "global.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "helpbox.h"
#include "functions.h"

// JP region-different msgids 0x147->0x821, 0x148->0x822
void DrawHelpBoxSaveMenuLabels(void)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 0, 8, GetStringFromIndex(0x821));
    Text_InsertDrawString(&gHelpBoxSt.text[0], 90, 8, GetStringFromIndex(0x822));
}
