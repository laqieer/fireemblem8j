#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"
#include "constants/items.h"

//! FE8U = 0x08012270
void EventPromoteUnitExt(struct Unit * unit, u8 jid, u8 item)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);

    SetWinEnable(0, 0, 0);

    ExecUnitPromotion(unit, jid, -1, 0);

    gBattleActor.weaponBefore = gBattleTarget.weaponBefore = item;

    gBattleStats.config = (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_PROMOTION_PREP);
    BeginBattleAnimations();

    return;
}
