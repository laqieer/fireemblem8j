#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

extern EWRAM_OVERLAY(0) struct Text gaBattleForecastTextStructs[6];
extern EWRAM_OVERLAY(0) u16 gBkselPals[8][16];

void PutBattleForecastMultipliers(struct BattleForecastProc * proc)
{
    int angle = (proc->unk_2C * 4) & 0xFF;

    int x = SIN(angle ) * 4 >> 12;
    int y = COS(angle) * 2 >> 12;

    x += proc->x * 8 - 3;
    y += proc->y * 8;

    if (proc->hitCountA > 1) {
        PutSprite(4, x + 72, y + 40, gObject_16x16, proc->hitCountA + 0x22E6);
    }

    if (proc->hitCountB > 1) {
        PutSprite(4, x + 24, y + 40, gObject_16x16, proc->hitCountB + 0x22E6);
    }
}
