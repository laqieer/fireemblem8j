#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"

extern struct Text * gpTurnRecordTexts;

void TurnRecord_SetupText(void)
{
    int i;

    BG_SetPosition(BG_1, 0, -136);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 24, 240, 136);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
    for (i = 0; i < 9; i++)
    {
        InitText(gpTurnRecordTexts + 0 + i, 4);
        InitText(gpTurnRecordTexts + 9 + i, 9);
    }
    InitText(gpTurnRecordTexts + 18, 3);
    InitText(gpTurnRecordTexts + 19, 2);
    Text_DrawString(gpTurnRecordTexts + 18, GetStringFromIndex(0xE6));
    Text_SetColor(gpTurnRecordTexts + 19, TEXT_COLOR_SYSTEM_GOLD);
    Text_DrawString(gpTurnRecordTexts + 19, GetStringFromIndex(0xDF));

    return;
}
