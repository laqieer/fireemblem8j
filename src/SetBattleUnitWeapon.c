#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "worldmap.h"
#include "constants/songs.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

void SetBattleUnitWeapon(struct BattleUnit* bu, int itemSlot) {
    if (itemSlot == BU_ISLOT_AUTO)
        itemSlot = GetUnitEquippedWeaponSlot(&bu->unit);

    if (bu->unit.state & US_IN_BALLISTA)
        itemSlot = BU_ISLOT_BALLISTA;

    bu->canCounter = TRUE;

    switch (itemSlot) {

    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
        // regular item slots

        bu->weaponSlotIndex = itemSlot;
        bu->weapon = bu->unit.items[bu->weaponSlotIndex];

        break;

    case BU_ISLOT_5:
        // borrowed item?

        bu->weaponSlotIndex = 0xFF;
        bu->weapon = gBmSt.um_tmp_item;

        break;

    case BU_ISLOT_ARENA_PLAYER:
        // arena player weapon

        bu->weaponSlotIndex = 0;

        bu->weapon = gArenaState.playerWeapon;
        bu->canCounter = FALSE;

        break;

    case BU_ISLOT_ARENA_OPPONENT:
        // arena opponent weapon

        bu->weaponSlotIndex = 0;

        bu->weapon = gArenaState.opponentWeapon;
        bu->canCounter = FALSE;

        break;

    case BU_ISLOT_BALLISTA:
        // riding ballista

        bu->weaponSlotIndex = 0xFF;

        bu->weapon = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);
        bu->canCounter = FALSE;

        break;

    default:
        bu->weaponSlotIndex = 0xFF;

        bu->weapon = 0;
        bu->canCounter = FALSE;

        break;

    } // switch (itemSlot)

    bu->weaponBefore = bu->weapon;
    bu->weaponAttributes = GetItemAttributes(bu->weapon);
    bu->weaponType = GetItemType(bu->weapon);

    if (!(gBattleStats.config & BATTLE_CONFIG_BIT2)) {
        if (bu->weaponAttributes & IA_MAGICDAMAGE) {
            switch (GetItemIndex(bu->weapon)) {

            case ITEM_SWORD_WINDSWORD:
                if (gBattleStats.range == 2)
                    bu->weaponType = ITYPE_ANIMA;
                else
                    bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

                break;

            case ITEM_SWORD_LIGHTBRAND:
                if (gBattleStats.range == 2)
                    bu->weaponType = ITYPE_LIGHT;
                else
                    bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

                break;

            case ITEM_SWORD_RUNESWORD:
                bu->weaponType = ITYPE_DARK;
                break;

            } // switch (GetItemIndex(bu->weapon))
        } // if (bu->weaponAttributes & IA_MAGICDAMAGE)

        if (!IsItemCoveringRange(bu->weapon, gBattleStats.range) || bu->weaponSlotIndex == 0xFF) {
            bu->weapon = 0;
            bu->canCounter = FALSE;
        }

        switch (bu->unit.statusIndex) {

        case UNIT_STATUS_SLEEP:
        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            bu->weapon = 0;
            bu->canCounter = FALSE;

            break;

        } // switch (bu->unit.statusIndex)
    }
}
