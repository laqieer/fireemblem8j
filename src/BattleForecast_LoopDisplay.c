#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

void DrawBattleForecastContents(struct BattleForecastProc * proc);

void BattleForecast_LoopDisplay(struct BattleForecastProc * proc)
{
    proc->unk_2C++;

    if (proc->needContentUpdate) {

        int side = GetBattleForecastPanelSide();

        if ((side != 0) && (side != proc->side)) {
            Proc_Break(proc);
            return;
        }

        DrawBattleForecastContents(proc);
        PutBattleForecastTilemaps(proc);
        InitBattleForecastFramePalettes();
    }

    if (proc->frameKind == 1) {
        PutBattleForecastWeaponTriangleArrows(proc);
        PutBattleForecastMultipliers(proc);
        UpdateBattleForecastEffectivenessPalettes(proc);
    }
}
