#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "event.h"

extern struct ProcCmd ProcScr_StdEventEngine[];
extern struct ProcCmd ProcScr_BattleEventEngine[];

void DeleteEventEngines(void) {
    Proc_EndEach(ProcScr_StdEventEngine);
    Proc_EndEach(ProcScr_BattleEventEngine);
}
