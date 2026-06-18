#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"
#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"

void SortPlayerUnitsForPrepScreen()
{
    int i, state1, state2;
    struct Unit *unit;
    int count = GetChapterAllyUnitCount();
    int _count = 0;

    InitUnitStack(gPrepUnitPool);

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->state &= 0xFDFFFFFF;

        if (IsUnitInCurrentRoster(unit) &&
            IsCharacterForceDeployed(unit->pCharacterData->number))
                PushUnit(unit);
    }

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit) ||
            !IsCharacterForceDeployed(unit->pCharacterData->number))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!IsUnitInCurrentRoster(unit))
            continue;

        if (SomeLeftoverFunctionThatReturns0(unit)) {
            state1 = unit->state;
            state2 = 0x02000008;
        } else {
            if (count > _count) {
                unit->state &= 0xFFFFFFF7;
                _count++;
                continue;
            }

            state1 = unit->state;
            state2 = 0x08;
        }

        unit->state = state1 | state2;
    }
}
