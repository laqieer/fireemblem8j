#include "global.h"

#include "proc.h"
#include "rng.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "mu.h"
#include "uiselecttarget.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmusemind.h"
#include "bmtrap.h"
#include "bmarch.h"
#include "bmtarget.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "popup.h"
#include "eventinfo.h"
#include "mapanim.h"

#include "bmmind.h"

#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

extern EWRAM_DATA struct ActionData gActionData;

extern struct ProcCmd CONST_DATA sProcScr_AfterDropAction[];

extern struct ProcCmd CONST_DATA sProcScr_DeathDropAnim[];

extern struct ProcCmd CONST_DATA sProcScr_CombatAction[];

extern struct ProcCmd CONST_DATA sProcScr_ArenaAction[];

struct BattleHit * StoreScriptBattleHits(struct BattleHit * r0)
{
    CpuFastCopy(r0, gActionData.script_hits, 0x1C);
    return gActionData.script_hits;
}
