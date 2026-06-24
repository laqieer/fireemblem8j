#include "global.h"

#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"

#include "constants/classes.h"
#include "constants/items.h"

#define UNIT_FACTION_FAKE(bu) ({ \
    s32 tmp = GetUnitFromCharId(UNIT_CHAR_ID(&(bu)->unit))->index; \
    asm("":::"r4"); \
    tmp & 0xC0; \
})

void RegisterEkrDragonStatusType(void)
{
    struct BattleUnit *bu1 = gpEkrBattleUnitLeft;
    struct BattleUnit *bu2 = gpEkrBattleUnitRight;

    struct BattleUnit *bu1a = bu1, *bu2a = bu2;

    s16 validl = gBanimValid[EKR_POS_L];
    s16 validr = gBanimValid[EKR_POS_R];

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        break;

    case EKR_DISTANCE_MONOCOMBAT:
    case EKR_DISTANCE_PROMOTION:
    default:
        return;
    }

    switch (UNIT_CLASS_ID(&bu1a->unit)) {
    case CLASS_MANAKETE_MYRRH:
        if (UNIT_FACTION_FAKE(bu1a) == UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu2->unit))))
            break;

        if (validl == false)
            break;

        if (GetItemIndex(bu1a->weaponBefore) == ITEM_DIVINESTONE)
            SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_MYRRH);

        break;

    case CLASS_DRACO_ZOMBIE:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DRACO_ZOMBIE);
        break;

    case CLASS_DEMON_KING:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_DEMON_KING);
        break;

    default:
        SetEkrDragonStatusType(gAnims[0], EKRDRGON_TYPE_NORMAL);
        break;
    }

    /* Judge another side */
    if (UNIT_CLASS_ID(&bu2a->unit) == CLASS_MANAKETE_MYRRH) {
        if (UNIT_FACTION_FAKE(bu1a) == UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bu2a->unit))))
            return;

        if (validr == false)
            return;

        if (GetItemIndex(bu2->weaponBefore) == ITEM_DIVINESTONE)
            SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_MYRRH);
    }
    else
        SetEkrDragonStatusType(gAnims[2], EKRDRGON_TYPE_NORMAL);
}
