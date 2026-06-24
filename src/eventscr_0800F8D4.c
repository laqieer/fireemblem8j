#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

//! FE8U = 0x0800F704
void LoadUnit_0(const struct UnitDefinition * def, u16 b, s8 quiet, s8 d)
{
    struct Unit * unit;

    const u8 allegianceLookup[3] = {
        [FACTION_ID_BLUE] = FACTION_BLUE,
        [FACTION_ID_GREEN] = FACTION_GREEN,
        [FACTION_ID_RED] = FACTION_RED,
    };

    if (def->allegiance == 0)
    {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);
    }
    else
    {
        unit = GetUnitFromCharIdAndFaction(def->charIndex, FACTION_BLUE);

        if (unit)
        {
            UnitChangeFaction(unit, allegianceLookup[def->allegiance]);
            unit = GetUnitFromCharId(def->charIndex);
        }
    }

    if (!unit)
    {
        unit = LoadUnit(def);

        if ((d == 1) && (def->allegiance == FACTION_ID_BLUE))
            unit->state |= US_BIT22;
    }
    else if (def->allegiance == FACTION_ID_BLUE)
    {
        s8 x, y;

        unit->state &= ~US_UNSELECTABLE;

        if (d == 1)
        {
            if (unit->state & US_DEAD)
                unit->state |= US_BIT22;
        }
        else
        {
            if (unit->state & US_BIT22)
                unit->state &= ~US_BIT22;
        }

        GenUnitDefinitionFinalPosition(def, &x, &y, 0);

        if (unit->xPos == x && unit->yPos == y)
            b &= ~0x0001;
    }

    unit->xPos = def->xPosition;
    unit->yPos = def->yPosition;

    if (def->allegiance == FACTION_ID_RED && unit->pCharacterData->number >= 0x3C)
    {
        if (!gPlaySt.config.controller)
        {
            if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
                UnitApplyBonusLevels(unit, -GetROMChapterStruct(gPlaySt.chapterIndex)->easyModeLevelMalus);
            else
                goto hard_mode;
        }
        else
        {
            if (gPlaySt.chapterStateBits & PLAY_FLAG_HARD)
            hard_mode:
                UnitApplyBonusLevels(unit, GetROMChapterStruct(gPlaySt.chapterIndex)->difficultModeLevelBonus);
        }
    }

    LoadUnit_MoveToPosition(unit, def, b, quiet);
}
