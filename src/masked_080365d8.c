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




int GetBattleForecastPanelSide(void)
{
    int x;

    x = (gBattleTarget.unit.xPos * 16) - gBmSt.camera.x;

    if (x < 0x70)
        return 1;

    if (x > 0x70)
        return -1;

    return 0;
}
