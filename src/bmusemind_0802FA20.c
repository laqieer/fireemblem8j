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

void ExecLightRuneSummon(ProcPtr proc) {
    int xPos, yPos;
    struct Unit* unit;
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleApplyItemEffect(proc);

    xPos = gActionData.xOther;
    yPos = gActionData.yOther;

    StartLightRuneAnim2(proc, xPos, yPos);

    // Seems to be required
    unit = 0;

    gUnk_39.charIndex = 0x80;
    gUnk_39.classIndex = CLASS_BERSERKER;
    gUnk_39.leaderCharIndex = 1;

    gUnk_39.autolevel = 0;
    gUnk_39.allegiance = 0;
    gUnk_39.level = 1;

    gUnk_39.xPosition = xPos;
    gUnk_39.yPosition = yPos;

    gUnk_39.redaCount = 0;
    gUnk_39.redas = NULL;

    gUnk_39.genMonster = 0;
    gUnk_39.itemDrop = 0;

    gUnk_39.items[0] = ITEM_AXE_STEEL;
    gUnk_39.items[1] = ITEM_AXE_SILVER;
    gUnk_39.items[2] = ITEM_AXE_DEVIL;
    gUnk_39.items[3] = ITEM_AXE_TOMAHAWK;

    gUnk_39.ai[0] = 0;
    gUnk_39.ai[1] = 0;
    gUnk_39.ai[2] = 0;
    gUnk_39.ai[3] = 0;

    // TODO: Can't seem to force the extra register allocation for the return, which is required for match
    unit = GetUnitFromCharId(1); // CHARACTER_EIRIKA
    if (!unit) {
        LoadUnits(&gUnk_39);
    }

    gBattleTarget.statusOut = -1;

    return;
}
