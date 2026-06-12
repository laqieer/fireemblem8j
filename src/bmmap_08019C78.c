#include "global.h"

#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmlib.h"

#include "constants/terrains.h"
#include "constants/chapters.h"
 void BmMapInit(void* buffer, u8*** outHandle, int width, int height);

 void RenderBmMapColumn(u16 xOffset);
 void RenderBmMapLine(u16 yOffset);

static void RefreshUnitsOnBmMap(void);
 void RefreshTorchlightsOnBmMap(void);
 void RefreshMinesOnBmMap(void);

extern EWRAM_OVERLAY(bmstart) u16 gBmMapBuffer[0x800 / 2];

enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this (overlaps with a lot of other objects?)


extern EWRAM_DATA struct Vec2 gBmMapSize;

extern EWRAM_DATA u8** gBmMapUnit;
extern EWRAM_DATA u8** gBmMapTerrain;
extern EWRAM_DATA u8** gBmMapMovement;
extern EWRAM_DATA u8** gBmMapRange;
extern EWRAM_DATA u8** gBmMapFog;
extern EWRAM_DATA u8** gBmMapHidden;
extern EWRAM_DATA u8** gBmMapOther;










extern EWRAM_DATA u8 gWorkingMovementScript[0x40];






extern u8*   gTilesetTerrainLookup;
extern u16** gBmMapBaseTiles;

void RefreshUnitsOnBmMap(void) {
    struct Unit* unit;
    int i;

    // 1. Blue & Green units

    for (i = 1; i < FACTION_RED; ++i) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        // Put unit on unit map
        gBmMapUnit[unit->yPos][unit->xPos] = i;

        // If fog is enabled, apply unit vision to fog map
        if (gPlaySt.chapterVisionRange)
            MapAddInRange(unit->xPos, unit->yPos, GetUnitFogViewRange(unit), 1);
    }

    // 2. Red (& Purple) units

    if (gPlaySt.faction != FACTION_RED) {
        // 2.1. No red phase

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            // If unit is magic seal, set fog in range 0-10.
            // Magic seal set the fog map probably solely for the alternate map palette.
            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gPlaySt.chapterVisionRange && !gBmMapFog[unit->yPos][unit->xPos]) {
                // If in fog, set unit bit on the hidden map, and set the "hidden in fog" state

                gBmMapHidden[unit->yPos][unit->xPos] |= HIDDEN_BIT_UNIT;
                unit->state = unit->state | US_BIT9;
            } else {
                // If not in fog, put unit on the map, and update state accordingly

                gBmMapUnit[unit->yPos][unit->xPos] = i;

                if (unit->state & US_BIT9)
                    unit->state = (unit->state &~ US_BIT9) | US_BIT8;
            }
        }
    } else {
        // 2.2. Yes red phase

        // This does mostly the same as the "No red phase" loop, except:
        // - It always puts the units on the unit map
        // - It never sets the "spotted" unit state bit (even if unit is seen)

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            // See above
            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gPlaySt.chapterVisionRange) {
                // Update unit state according to fog level

                if (!gBmMapFog[unit->yPos][unit->xPos])
                    unit->state = unit->state | US_BIT9;
                else
                    unit->state = unit->state &~ US_BIT9;
            }

            // Put on unit map
            gBmMapUnit[unit->yPos][unit->xPos] = i;
        }
    }
}
