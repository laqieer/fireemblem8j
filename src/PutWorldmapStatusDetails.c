#include "global.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "helpbox.h"
#include "worldmap.h"
#include "constants/songs.h"

int WorldmapStatus_CountAllies(void);

struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};

//! FE8U = 0x080C0A9C
void PutWorldmapStatusDetails(struct WorldmapStatusProc * proc)
{
    const char * charName;
    const char * nodeName;
    int x;

    charName = GetStringFromIndex(proc->unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(64, charName);
    BattleGenerateUiStats(proc->unit, GetUnitEquippedWeaponSlot(proc->unit));
    PutDrawText(&proc->text[0], TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 10), TEXT_COLOR_SYSTEM_WHITE, x, 0, charName);

    PutDrawText(
        NULL, TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 13), TEXT_COLOR_SYSTEM_WHITE, 0, 7,
        GetStringFromIndex(proc->unit->pClassData->nameTextId));

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 15), TEXT_COLOR_SYSTEM_GOLD, 0x1f /* JP special-char index (US TEXT_SPECIAL_35=0x35) */);

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 21, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_SLASH);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 15), TEXT_COLOR_SYSTEM_BLUE, proc->unit->exp);

    if (GetUnitCurrentHp(proc->unit) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 20, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitCurrentHp(proc->unit));
    }

    if (GetUnitMaxHp(proc->unit) >= 100)
    {
        PutTwoSpecialChar(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 22, 17), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 23, 17), TEXT_COLOR_SYSTEM_BLUE, GetUnitMaxHp(proc->unit));
    }

    nodeName = GetWorldMapNodeName(GetNextUnclearedNode(&gGMData));
    x = GetStringTextCenteredPos(72, nodeName);
    Text_Skip(&proc->text[1], 5);

    PutDrawText(&proc->text[1], TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 6), TEXT_COLOR_SYSTEM_WHITE, x, 0, nodeName);
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 9), TEXT_COLOR_SYSTEM_BLUE, WorldmapStatus_CountAllies());

    return;
}
