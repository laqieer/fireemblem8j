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

void InitBattleForecastLabels(void)
{
    static const int sBattleForecastLabelStringIndexes[] = {
        0x503, // Mt
        0x4F4, // Hit[.]
        0x501, // Crit
        0x4F3, // Atk[.]
        0x4EF, // Def[.]
        0x504, // AS
    };

    int i;

    for (i = 0; i < 6; ++i) {
        int textIndex;

        InitText(gaBattleForecastTextStructs + i, 4);

        textIndex = sBattleForecastLabelStringIndexes[i];

        Text_InsertDrawString(
            gaBattleForecastTextStructs + i,
            GetStringTextCenteredPos(0x20, GetStringFromIndex(textIndex)),
            3,
            GetStringFromIndex(textIndex)
        );
    }
}
