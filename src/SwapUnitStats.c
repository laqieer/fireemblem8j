#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"

void SwapUnitStats(struct Unit* unitA, struct Unit* unitB)
{
    if (unitA && unitB)
    {
        #define SWAP(aType, aLValueA, aLValueB) \
        do { \
            int tmp; \
            tmp = (s8)(aLValueA); \
            (aLValueA) = (aLValueB); \
            (aLValueB) = tmp; \
        } while (0)

        #define SWAPH(aType, aLValueA, aLValueB) \
        do { \
            aType tmp; \
            tmp = (aLValueA); \
            (aLValueA) = (aLValueB); \
            (aLValueB) = tmp; \
        } while (0)

        SWAP(u8, unitA->level, unitB->level);
        SWAP(u8, unitA->exp, unitB->exp);

        SWAP(u8, unitA->maxHP, unitB->maxHP);
        SWAP(u8, unitA->curHP, unitB->curHP);
        SWAP(u8, unitA->pow, unitB->pow);
        SWAP(u8, unitA->skl, unitB->skl);
        SWAP(u8, unitA->spd, unitB->spd);
        SWAP(u8, unitA->def, unitB->def);
        SWAP(u8, unitA->res, unitB->res);
        SWAP(u8, unitA->lck, unitB->lck);
        SWAP(u8, unitA->conBonus, unitB->conBonus);
        SWAP(u8, unitA->movBonus, unitB->movBonus);

        SWAPH(u16, unitA->items[0], unitB->items[0]);
        SWAPH(u16, unitA->items[1], unitB->items[1]);
        SWAPH(u16, unitA->items[2], unitB->items[2]);
        SWAPH(u16, unitA->items[3], unitB->items[3]);
        SWAPH(u16, unitA->items[4], unitB->items[4]);

        #undef SWAP
        #undef SWAPH
    }
}
