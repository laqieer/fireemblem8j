#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bonusclaim.h"

// TODO: Should be in "bmsave.h", but doing so causes a non-match (implicit declaration?) in "bonusclaim.c"
bool LoadBonusContentData(void *buf);


extern EWRAM_DATA bool gBoolSramWorking;






extern CONST_DATA struct SaveBlocks *gSram;



void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty)
{
    int i, j;
    int best = 0;
    u16 hours, minutes, seconds;

    CpuFill16(0, buf, sizeof(struct GameRankSaveData));

    buf->valid = 1;
    buf->chapter_mode = chapter_mode;
    buf->chapter_stat = difficulty;

    buf->gold = GetPartyTotalGoldValue();
    
    buf->unk00_16 = gPlaySt.unk_2B_00;
    buf->unk00_17 = gPlaySt.unk_2C_04;

    FormatTime(GetGameTotalTime(), &hours, &minutes, &seconds);
    buf->hours = hours;
    buf->minutes = minutes;
    buf->seconds = seconds;

    buf->cuteguy = 0;
    buf->luckydog = 0;

    for (i = 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (US_GROWTH_BOOST & unit->state) {
            if (US_DEAD & unit->state)
                break;
            
            buf->luckydog = unit->pCharacterData->number;
            break;
        }
    }

    for (j = 1; j < FACTION_GREEN; j++) {
        struct Unit *unit = GetUnit(j);

        if (0 == UNIT_IS_VALID(unit))
            continue;

        if (0 != ((CA_LOCK_1 | CA_STEAL) & unit->state))
            continue;

        if (PidStatsGetFavval(unit->pCharacterData->number) <= best)
            continue;

        best = PidStatsGetFavval(unit->pCharacterData->number);
        buf->cuteguy = unit->pCharacterData->number;
    }

    buf->tacticsRank = GetGameTacticsRank();
    buf->fundsRank = GetGameFundsRank();
    buf->survivalRank = GetGameSurvivalRank();
    buf->expRank = GetGameExpRank();
    buf->combatRank = GetGameCombatRank();

    buf->unk00_01 = GetOverallRank(buf->tacticsRank, buf->survivalRank, buf->fundsRank, buf->expRank, buf->combatRank);
    buf->unk08_15 = GetCurCompleteChapters();
    strcpy((void*)&buf->tactician_name, GetTacticianName());
}
