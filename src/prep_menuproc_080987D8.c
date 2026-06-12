#include "global.h"

#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"

#include "constants/chapters.h"
#include "constants/songs.h"

s8 CheckInLinkArena(void);

void DoPromoteAnimForChar100(struct Proc08A184B4 * proc)
{
    struct Unit * unit;

    unit = GetUnitFromCharId(0x100);

    if (!unit)
    {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetGameLock();
    SetWinEnable(0, 0, 0);

    ExecUnitDefaultPromotion(unit, -1, 0);
    gBattleStats.config = BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_PROMOTION_PREP;
    gBattleActor.weaponBefore = 0;
    gBattleTarget.weaponBefore = 0;
    BeginBattleAnimations();
}
