#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "constants/items.h"
#include "constants/characters.h"

void AutolevelSecondaryLord()
{
    u8 i;
    struct BattleUnit bunit;
    struct Unit *unit;

    switch (gPlaySt.chapterModeIndex) {
    case CHAPTER_MODE_EIRIKA:
        unit = GetUnitFromCharId(CHARACTER_EPHRAIM);
        break;

    case CHAPTER_MODE_EPHRAIM:
        unit = GetUnitFromCharId(CHARACTER_EIRIKA);
        break;
    }

    if (unit->level < 15) {
        u8 old_level = unit->level;
        u8 tar_level = unit->level + 6;

        if (tar_level < 10)
            tar_level = 10;
        if (tar_level > 15)
            tar_level = 15;

        while (old_level < tar_level) {
            InitBattleUnit(&bunit, unit);
            bunit.unit.exp += 100;
            CheckBattleUnitLevelUp(&bunit);
            UpdateUnitFromBattle(unit, &bunit);
            old_level++;
        }
        unit->exp = 0;
    }

    for (i = 0; i < 8; i++) {
        u8 rank = unit->ranks[i] - 1;
        if (rank <= 0x45)
            unit->ranks[i] = 0x47;
    }

    for (i = 0; i < 5; i++) {
        if (0 == unit->items[i]) {
            switch (gPlaySt.chapterModeIndex) {
            case CHAPTER_MODE_EIRIKA:
                UnitAddItem(unit, MakeNewItem(ITEM_LANCE_STEEL));
                break;

            case CHAPTER_MODE_EPHRAIM:
                UnitAddItem(unit, MakeNewItem(ITEM_SWORD_STEEL));
                break;
            }
            break;
        }
    }
}
