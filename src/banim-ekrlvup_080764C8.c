#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void EkrLvup_Promo_DrawPromoNewClassName(struct ProcEkrLevelup *proc)
{
    if (proc->is_promotion == false) {
        Proc_Break(proc);
        return;
    }

    gEkrLvupScrollPos1 = Interpolate(1, 0, 0x1000, proc->timer, proc->index);

    if (++proc->timer > proc->index) {
        gpEkrLvupUnit = &gpEkrLvupBattleUnit->unit;
        EkrLvup_DrawUnitName(proc);

        gEkrLvupPreLevel = gEkrLvupPostLevel;
        EkrLvup_DrawPreLevelValue(proc);

        proc->timer = 0;
        proc->index = 8;

        Proc_Break(proc);
    }
}
