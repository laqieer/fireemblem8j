#include "global.h"

#include "cp_common.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"

#include "constants/items.h"
#include "constants/terrains.h"



// forward declarations
void AiFillDangerMap(void);
s8 AiUpdateGetUnitIsHealing(struct Unit*);
const struct AiEscapePt* GetEscapePointStructThingMaybe(void);
void AiMarkStaffCapabilityFlags(u16);
s8 AiIsWithinFlyingDistance(struct Unit*, int, int);
int StoreItemAndGetUnitAttack(struct Unit*, u16*);
s8 AiTryDoDanceAdjacent(int, int);
s8 AiTryDoStealAdjacent(int, int);
s8 AiTryDoCombatInRangeFromPosition(int, int);

/* file-scope type definitions used by this run */


struct Unknown_Sub80315C {
    u8* unk_00;
    u8 unk_04;
    u8 unk_05;
};

struct UnknownSub803F4A4 {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    u8 unk_03;
};

//! FE8U = 0x0803E718
bool AiTryHealSelf(void)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = gActiveUnit->items[i];

        if (item == 0)
            return 0;

        if (GetItemIndex(item) == ITEM_VULNERARY || GetItemIndex(item) == ITEM_ELIXIR)
        {
            if (!(gAiState.flags & AI_FLAG_STAY) && !(gActiveUnit->ai_config & AI_UNIT_CONFIG_FLAG_STAY))
            {
                /**
                 * If unit can move around (rather than stick on position)
                 * he may try escape to a safe place then heal itself.
                 */
                struct Vec2 position;
                if (AiFindSafestReachableLocation(gActiveUnit, &position) == true)
                {
                    AiSetDecision(position.x, position.y, AI_ACTION_USEITEM, 0, i, 0, 0);
                    return true;
                }
            }
            else
            {
                AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, AI_ACTION_USEITEM, 0, i, 0, 0);
                return true;
            }
        }
    }
    return false;
}
