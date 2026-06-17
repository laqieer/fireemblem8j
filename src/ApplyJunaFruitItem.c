#include "global.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "proc.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "rng.h"
#include "uiselecttarget.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmtrick.h"
#include "bmtrap.h"
#include "bmtarget.h"
#include "popup.h"
#include "bmudisp.h"
#include "classchg.h"
#include "eventinfo.h"
#include "bmmind.h"
#include "bmusemind.h"
#include "constants/songs.h"



extern s8 JunaItemEffLevelLut[];

int ApplyJunaFruitItem(struct Unit* unit, int slot) {
    int rn1 = 0;
    int rn2;
    u32 levelCount = 0;

    while (levelCount <= 4) {
        rn1 += JunaItemEffLevelLut[levelCount];
        levelCount++;
    }

    rn2 = NextRN_N(rn1);

    levelCount = 0;
    rn1 = JunaItemEffLevelLut[levelCount];
    if (rn1 <= rn2) {
		while (++levelCount < 5) {
			rn1 += JunaItemEffLevelLut[levelCount];

            /**
             * Got a random number in [1, 5]...
             * What a stupid method!
             */
			if (rn1 > rn2)
				break;
		}
    }

    levelCount++;
    unit->level -= levelCount;
    unit->exp = 0;

    UnitUpdateUsedItem(unit, slot);

    return levelCount;
}
