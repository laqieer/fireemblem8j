#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"

#include "bm.h"

#include "constants/event-flags.h"
#include "constants/songs.h"

static inline int CheckAltBgm(u8 base, u8 alt) {
    if (!CheckFlag(EVFLAG_BGM_CHANGE)) {
        return base;
    } else {
        return alt;
    }
}

//! FE8U = 0x08015FD4
int GetCurrentMapMusicIndex(void) {
    int aliveUnits;
    u32 mapKind;

    u8 blueBgmIdx = CheckAltBgm(MAP_BGM_BLUE, MAP_BGM_BLUE_GREEN_ALT);
    u8 redBgmIdx = CheckAltBgm(MAP_BGM_RED, MAP_BGM_RED_ALT);
    u8 greenBgmIdx;

    if (!CheckFlag(EVFLAG_BGM_CHANGE)) {
        greenBgmIdx = MAP_BGM_GREEN;
        greenBgmIdx++; greenBgmIdx--;
    } else {
        greenBgmIdx = MAP_BGM_BLUE_GREEN_ALT;
    }

    switch (gPlaySt.faction) {
        case FACTION_RED:
            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[redBgmIdx];

        case FACTION_GREEN:
            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[greenBgmIdx];

        case FACTION_BLUE:

            if (CheckFlag(EVFLAG_BGM_CHANGE)) {
                return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[blueBgmIdx];
            }

            if ((GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH) || GetROMChapterStruct(gPlaySt.chapterIndex)->victorySongEnemyThreshold != 0) {
                aliveUnits = CountUnitsInState(FACTION_RED, US_UNAVAILABLE);
                mapKind = GetBattleMapKind();

                if ((mapKind != BATTLEMAP_KIND_SKIRMISH && aliveUnits <= GetROMChapterStruct(gPlaySt.chapterIndex)->victorySongEnemyThreshold)
                    || (mapKind == BATTLEMAP_KIND_SKIRMISH && aliveUnits <= 1))
                    return SONG_GRASP_AT_VICTORY;
            }

            return GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[blueBgmIdx];
    }
}
