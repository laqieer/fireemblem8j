#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "bmbattle.h"
#include "bm.h"
#include "hardware.h"
#include "bmusemind.h"
#include "ap.h"
#include "soundwrapper.h"
#include "cgtext.h"
#include "sysutil.h"

extern CONST_DATA struct ProcCmd ProcScr_ClassChgReal[];

void ClassChgExecPromotionReal(struct ProcClassChgPostConfirm *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *gparent = parent->proc_parent;

    struct Unit *unit = GetUnitFromCharId(parent->pid);

    if (unit == NULL) {
        Proc_End(proc);
        return;
    }

    proc->game_lock = GetGameLock();
    SetWinEnable(0, 0, 0);
    ExecUnitPromotion(unit, parent->jid, -1, 0);

    if (gparent->bmtype != PROMO_HANDLER_TYPE_PREP)
        gBattleStats.config = BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_PROMOTION;
    else
        gBattleStats.config = BATTLE_CONFIG_PROMOTION;

    BeginBattleAnimations();
}
