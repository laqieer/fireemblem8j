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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_SetTargetStatus[];

void ActionPick(ProcPtr proc) {
    int xPos, yPos;
    gBattleActor.hasItemEffectTarget = 0;

    xPos = gActionData.xOther;
    yPos = gActionData.yOther;

    StartAvailableDoorTileEvent(xPos, yPos);

    StartAvailableChestTileEvent(xPos, yPos);

    PlaySoundEffect(SONG_B1);

    gBattleTarget.statusOut = -1;

    if (gBattleTarget.statusOut >= 0) {
        Proc_StartBlocking(ProcScr_SetTargetStatus, proc);
    }

    return;
}
