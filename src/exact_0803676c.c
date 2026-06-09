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




void BattleForecastHitCountUpdate(struct BattleUnit * battleUnit, u8 * hitsCounter, int * usesCounter)
{

    if (*usesCounter > 0) {
        *hitsCounter = *hitsCounter + 1;
        *usesCounter = *usesCounter - 1;

        if (battleUnit->weaponAttributes & IA_BRAVE) {
            *hitsCounter = *hitsCounter + 1;
            *usesCounter = *usesCounter - 1;
        }
    }
}
