#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "player_interface.h"

#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

// clang-format off







































//! FE8U = 0x0808C360
void ClearUnitMapUiStatus(struct PlayerInterfaceProc * proc, u16 * buffer, struct Unit * unit)
{
    buffer[0] = TILEREF(0x120, 2);
    buffer[1] = TILEREF(0x121, 2);
    buffer[2] = 0;
    buffer[3] = 0;
    buffer[4] = TILEREF(0x13E, 2);
    buffer[5] = 0;
    buffer[6] = 0;

    return;
}
