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




/* prototypes for same-file helpers called by this run */
int GetBattleForecastPanelSide(void);
void DrawBattleForecastContents(struct BattleForecastProc * proc);
void InitBattleForecastFramePalettes(void);

void BattleForecast_OnNewBattle(struct BattleForecastProc * proc)
{
    DrawBattleForecastContents(proc);

    proc->side = GetBattleForecastPanelSide();
    proc->slide_offset = 0;

    if (proc->side < 0) {
        proc->x = 0;
    } else {
        proc->x = 20;
    }

    proc->y = 0;

    InitBattleForecastFramePalettes();
}
