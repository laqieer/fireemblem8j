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




const u16 * GetFactionBattleForecastFramePalette(int faction)
{

    switch (faction) {
        case FACTION_BLUE:
            return gUiFramePaletteA;

        case FACTION_RED:
            return gUiFramePaletteB;

        case FACTION_GREEN:
            return gUiFramePaletteC;

        case FACTION_PURPLE:
            return gUiFramePaletteD;
    }
}
