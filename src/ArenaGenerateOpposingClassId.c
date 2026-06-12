#include "global.h"
#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bmsave.h"
#include "bmarena.h"
#include "bmmind.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
/* TU-private data externs bound at their JP addresses */
extern u8 gClassList_BowArena[];
extern u8 gClassList_MagicArena[];
extern u8 gClassList_MeleeArena[];

int ArenaGenerateOpposingClassId(int weaponType) {
    int i;
    int promotedFlag;
    int classNum;

    int classCount = 0;
    u8* classList = NULL;

    switch (weaponType) {
        case ITYPE_SWORD:
        case ITYPE_LANCE:
        case ITYPE_AXE:
            classList = gClassList_MeleeArena;
            break;

        case ITYPE_BOW:
            classList = gClassList_BowArena;
            break;

        case ITYPE_ANIMA:
        case ITYPE_LIGHT:
        case ITYPE_DARK:
            classList = gClassList_MagicArena;
            break;
    }

    promotedFlag = UNIT_CATTRIBUTES(gArenaState.playerUnit) & CA_PROMOTED;

    for (i = 0; classList[i] != 0; i++) {

        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag) {
            continue;
        }

        classCount++;
    }

    classNum = NextRN_N(classCount);

    for (i = 0, classCount = 0; TRUE; i++) {
        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag) {
            continue;
        }

        if (classCount == classNum) {
            break;
        }

        classCount++;
    }

    return classList[i];
}
