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

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);







// lightrunefx.s
void StartLightRuneAnim(ProcPtr, int, int);
void StartLightRuneAnim2(ProcPtr, int, int);

// minefx.s
void StartMineAnim(ProcPtr, int, int);

void ExecMine(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddTrap(gActionData.xOther, gActionData.yOther, TRAP_MINE, 0);

    BattleApplyItemEffect(proc);

    gBattleTarget.statusOut = -1;

    StartMineAnim(proc, gActionData.xOther, gActionData.yOther);

    return;
}
