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

void UpdateBattleForecastEffectivenessPalettes(struct BattleForecastProc * proc)
{
    static u8 palAnimLut[] = {
        0, 1, 1, 2, 3, 4, 5, 5,
        4, 4, 4, 3, 3, 3, 2, 2,
        2, 2, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
    };

    int palAnim;

    if (proc->isEffectiveA != 0) {
        palAnim = palAnimLut[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    ApplyPalette(gBkselPals[palAnim], 3);

    if (proc->isEffectiveB != 0) {
        palAnim = palAnimLut[proc->unk_2C & 0x1F];
    } else {
        palAnim = 0;
    }

    ApplyPalette(gBkselPals[palAnim], 4);
}
