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

void ExecJunaFruitItem(ProcPtr proc) {
    struct Unit* unit = GetUnit(gActionData.subjectIndex);
    int itemId = unit->items[gActionData.itemSlotIndex];
    int levelCount;

    gBattleTarget.statusOut = -1;

    levelCount = ApplyJunaFruitItem(unit, gActionData.itemSlotIndex);

    PlaySoundEffect(SONG_5A);

    NewPopup2_PlanB(proc, GetItemIconId(itemId), 0, levelCount, GetStringFromIndex(0x81D));

    return;
}
