#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "mapanim.h"
#include "bmlib.h"
#include "bmtrick.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/songs.h"

//! FE8U = 0x0807CF30
void LoadGorgonFromEgg(struct MAEffectProc * proc)
{
    int unused = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Trap * trap = GetTrapAt(proc->unit->xPos, proc->unit->yPos);

    int level = trap
        ? (u8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]
        : 1;

    u8 i;

    gUnitDefEggHatching.charIndex = CHARACTER_MONSTER_BA;
    gUnitDefEggHatching.classIndex = CLASS_GORGON;
    gUnitDefEggHatching.leaderCharIndex = 0;
    gUnitDefEggHatching.autolevel = TRUE;

    if (UNIT_FACTION(proc->unit) == FACTION_BLUE)
        gUnitDefEggHatching.allegiance = FACTION_ID_BLUE;

    else if (UNIT_FACTION(proc->unit) == FACTION_RED)
        gUnitDefEggHatching.allegiance = FACTION_ID_RED;

    else if (UNIT_FACTION(proc->unit) == FACTION_GREEN)
        gUnitDefEggHatching.allegiance = FACTION_ID_GREEN;

    gUnitDefEggHatching.level = level;

    gUnitDefEggHatching.xPosition = proc->unit->xPos;
    gUnitDefEggHatching.yPosition = proc->unit->yPos;

    gUnitDefEggHatching.redaCount = 0;
    gUnitDefEggHatching.redas = NULL;

    gUnitDefEggHatching.genMonster = FALSE;
    gUnitDefEggHatching.itemDrop = FALSE;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; i++)
        gUnitDefEggHatching.items[i] = 0;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; i++)
        if (proc->unit->items[i + 1])
            gUnitDefEggHatching.items[i] = proc->unit->items[i + 1];

    if (proc->unit->state & US_DROP_ITEM)
        gUnitDefEggHatching.itemDrop = TRUE;

    gUnitDefEggHatching.ai[0] = proc->unit->ai1;
    gUnitDefEggHatching.ai[1] = proc->unit->ai2;
    gUnitDefEggHatching.ai[2] = proc->unit->ai_a_pc; // this looks incorrect
    gUnitDefEggHatching.ai[3] = proc->unit->ai_a_pc >> 8; // this is 0

    LoadUnits(&gUnitDefEggHatching);
    GetUnitFromCharId(CHARACTER_MONSTER_BA);

    ClearUnit(GetUnit(proc->unit->index));

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    EndAllMus();
}
