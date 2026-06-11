#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

//! FE8U = 0x080A8950
int LoadSaveMenuInfo(int slot)
{
    int leaderId;
    struct GameSaveBlock *saveBase;
    int i;
    struct PlaySt chapterData;
    struct Unit unit;
    struct GMapData mapData;
    u8 localbuffer[4] __attribute__((unused));

    if (!IsSaveValid(slot))
        return 0;

    ReadGameSavePlaySt(slot, &chapterData);

    switch (chapterData.chapterModeIndex) {
    case CHAPTER_MODE_COMMON:
    case CHAPTER_MODE_EIRIKA:
    default:
        leaderId = CHARACTER_EIRIKA;
        break;

    case CHAPTER_MODE_EPHRAIM:
        leaderId = CHARACTER_EPHRAIM;
        break;
    }

    saveBase = GetSaveReadAddr(slot);

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
    {
        LoadSavedUnit(&saveBase->units[i], &unit);
        if (unit.pCharacterData != NULL && unit.pCharacterData->number == leaderId)
            break;
    }

    if (i < UNIT_SAVE_AMOUNT_BLUE)
    {
        gSaveMenuRTextData.pid = leaderId;
        gSaveMenuRTextData.level = unit.level;

        ReadWorldMapStuff(&saveBase->wmStuff, &mapData);
        gSaveMenuRTextData.nodeId = mapData.units[0].location;

        return 2;
    }

    InitSaveMenuHelpTextSt();
    return 2;
}
