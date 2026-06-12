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

/* prototypes for same-file helpers called by this run */
void PrepItemUseJuna_OnDraw(struct ProcPrepItemUseJunaFruit *proc, int x, int y, int msg, int item);

void PrepItemUseJuna_OnInit(struct ProcPrepItemUseJunaFruit * proc)
{
    int item, lv_pre, lv_chg;
    struct ProcPrepItemUse *parent = proc->proc_parent;
    StartManimLevelUpStatGainLabels(0x1C0, 3, 0, proc);

    proc->lv_pre = parent->unit->level;

    item = parent->unit->items[parent->slot];
    lv_chg = ApplyJunaFruitItem(parent->unit, parent->slot);

    DrawPrepScreenItemUseStatBars(parent->unit, 0);
    DrawPrepScreenItemUseStatValues(parent->unit);

    proc->lv_pst = parent->unit->level;

    PrepItemUseJuna_OnDraw(proc, 0x11, 0xE, lv_chg, item);

    if (proc->lv_pre != proc->lv_pst)
        StartPrepItemBoostStatGainLabelAnim(0xB0, 0x1A, proc->lv_pst - proc->lv_pre);

    proc->timer = 0x78;

    PlaySoundEffect(SONG_5A);
}
