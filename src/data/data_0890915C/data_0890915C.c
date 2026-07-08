#include "global.h"
#include "bmunit.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"

/* Typed UnitDefinition[] table (was a de-pointered .4byte blob).
 * Byte-identical to fe8u UnitDef_Ch4Ally_1 ++ UnitDef_Ch4Ally_2.
 * The REDA move-script symbols are defined as u8[] in data_08908DBC.c.
 */
extern u8 REDA_Ch4Ally_1_ARTUR[];
extern u8 REDA_Ch4Ally_2_LUTE[];

SECTION(".data.residue.0890915C")
struct UnitDefinition UnitDef_Ch4Ally_1[] = {
    /* UnitDef_Ch4Ally_1 */
    {
        .charIndex = CHARACTER_ARTUR,
        .classIndex = CLASS_MONK,
        .allegiance = FACTION_ID_BLUE,
        .level = 2,
        .xPosition = 9,
        .yPosition = 10,
        .redaCount = 3,
        .redas = REDA_Ch4Ally_1_ARTUR,
        .items = {
            ITEM_LIGHT_LIGHTNING,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};

SECTION(".data.residue.08909184")
struct UnitDefinition UnitDef_Ch4Ally_2[] = {
    /* UnitDef_Ch4Ally_2 */
    {
        .charIndex = CHARACTER_LUTE,
        .classIndex = CLASS_MAGE_F,
        .allegiance = FACTION_ID_BLUE,
        .level = 1,
        .xPosition = 1,
        .yPosition = 11,
        .redaCount = 1,
        .redas = REDA_Ch4Ally_2_LUTE,
        .items = {
            ITEM_ANIMA_FIRE,
            ITEM_VULNERARY,
        },
    },
    { 0 },
};
