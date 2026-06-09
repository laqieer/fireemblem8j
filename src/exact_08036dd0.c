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
void InitBattleForecastBattleStats(struct BattleForecastProc * proc);
void DrawBattleForecastContentsStandard(struct BattleForecastProc * proc);
void DrawBattleForecastContentsExtended(struct BattleForecastProc * proc);

void DrawBattleForecastContents(struct BattleForecastProc * proc)
{
    proc->unk_2C = 0;
    proc->needContentUpdate = 0;

    switch (proc->frameKind) {
        case 1:
            InitBattleForecastBattleStats(proc);
            DrawBattleForecastContentsStandard(proc);
            break;

        case 2:
            InitBattleForecastBattleStats(proc);
            DrawBattleForecastContentsExtended(proc);
            break;
    }
}
