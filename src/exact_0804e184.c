#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

// clang-format on

//! FE8U = 0x0804D3F0
void SetUnitItemUsesToMax(struct Unit * unit, int itemSlot)
{
    u16 item = unit->items[itemSlot];

    if (item != 0)
    {
        unit->items[itemSlot] = item | 0xff00;
    }

    return;
}

//! FE8U = 0x0804D40C
void SetUnitAllItemsUsesToMax(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        SetUnitItemUsesToMax(unit, i);
    }

    return;
}
