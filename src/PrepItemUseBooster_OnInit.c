#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "icon.h"
#include "hardware.h"
#include "mapanim.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "constants/songs.h"




void PrepItemUseBooster_OnInit(struct ProcPrepItemUseBooster * proc)
{
    int i, item, msg;
    struct ProcPrepItemUse *parent = proc->proc_parent;

    StartManimLevelUpStatGainLabels(0x1C0, 3, 0, proc);

    proc->status_pre[EKRLVUP_STAT_HP] = GetUnitCurrentHp(parent->unit);
    proc->status_pre[EKRLVUP_STAT_POW] = GetUnitPower(parent->unit);
    proc->status_pre[EKRLVUP_STAT_SKL] = GetUnitSkill(parent->unit);
    proc->status_pre[EKRLVUP_STAT_SPD] = GetUnitSpeed(parent->unit);
    proc->status_pre[EKRLVUP_STAT_LCK] = GetUnitLuck(parent->unit);
    proc->status_pre[EKRLVUP_STAT_DEF] = GetUnitDefense(parent->unit);
    proc->status_pre[EKRLVUP_STAT_RES] = GetUnitResistance(parent->unit);
    proc->status_pre[EKRLVUP_STAT_CON] = UNIT_CON(parent->unit);

    item = parent->unit->items[parent->slot];

    msg = ApplyStatBoostItem(parent->unit, parent->slot);
    
    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    DrawPrepScreenItemUseStatValues(parent->unit);

    proc->status_pst[EKRLVUP_STAT_HP] = GetUnitCurrentHp(parent->unit);
    proc->status_pst[EKRLVUP_STAT_POW] = GetUnitPower(parent->unit);
    proc->status_pst[EKRLVUP_STAT_SKL] = GetUnitSkill(parent->unit);
    proc->status_pst[EKRLVUP_STAT_SPD] = GetUnitSpeed(parent->unit);
    proc->status_pst[EKRLVUP_STAT_LCK] = GetUnitLuck(parent->unit);
    proc->status_pst[EKRLVUP_STAT_DEF] = GetUnitDefense(parent->unit);
    proc->status_pst[EKRLVUP_STAT_RES] = GetUnitResistance(parent->unit);
    proc->status_pst[EKRLVUP_STAT_CON] = UNIT_CON(parent->unit);

    PrepItemUseBooster_OnDraw(proc, 0x11, 0xE, msg, item);

    for (i = 0; i < EKRLVUP_STAT_MAX; i++) {
        if (proc->status_pre[i] == proc->status_pst[i])
            continue;

        StartPrepItemBoostStatGainLabelAnim(
            (i >> 2) * 56 + 0xB0,
            (i  & 3) * 16 + 0x2A,
            proc->status_pst[i] - proc->status_pre[i]
        );
    }

    proc->timer = 0x78;
    PlaySoundEffect(SONG_5A);
}
