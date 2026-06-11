#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
void PidStatsAddWinAmt(u8 pid);
void PidStatsRecordLoseData(u8 pid);

void PidStatsRecordBattleRes(void)
{
    struct BattleUnit *buA = NULL, *buB = NULL;

    if (0 == GetUnitCurrentHp(&gBattleActor.unit)) {
        buA = &gBattleActor;
        buB = &gBattleTarget;
    }

    if (0 == GetUnitCurrentHp(&gBattleTarget.unit)) {
        buA = &gBattleTarget;
        buB = &gBattleActor;
    }

    if (NULL != buA) {
        if (NULL != buB && FACTION_BLUE == UNIT_FACTION(&buB->unit)) {
            PidStatsAddWinAmt(UNIT_CHAR_ID(&buB->unit));
            gPlaySt.unk48++;
        }

        if (NULL != buA && FACTION_BLUE == UNIT_FACTION(&buA->unit))
            PidStatsRecordLoseData(UNIT_CHAR_ID(&buA->unit));
    }
}

bool IsPlaythroughIdUnique(int index)
{
    int i;
    struct GlobalSaveInfo info;
    struct PlaySt ram_ch;

    ReadGlobalSaveInfo(&info);

    for (i = 0; i < 0xC; i++)
        if (info.cleared_playthroughs[i] == index)
            return 0;

    for (i = 0; i < 3; i++) {
        if (!IsSaveValid(i))
            continue;

        ReadGameSavePlaySt(i, &ram_ch);

        if (ram_ch.playthroughIdentifier == index)
            return 0;
    }
    
    return 1;
}
