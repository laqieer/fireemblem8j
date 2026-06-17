#include "global.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"


struct AiSpecialItemLutEntry {
    u16 itemId;
    void(*func)(int itemIdx);
};
struct UnknownAiInputA {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
};
struct UnknownAiInputB {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    
    struct UnitDefinition* unk_04;
};
extern u8  gUnkData_4[];
void GenerateUnitExtendedMovementMapOnRange(struct Unit* unit);

s8 AiFindClosestChestPosition(struct Unit* unit, struct Vec2* pos) {
    GenerateUnitExtendedMovementMapOnRange(unit);

    if (AiFindClosestTerrainPosition(gUnkData_4, 0, pos) == 0) {
        return 0;
    }

    return 1;
}
