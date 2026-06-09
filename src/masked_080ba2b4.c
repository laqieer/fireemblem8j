#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"
#include "constants/songs.h"

extern struct ProcCmd gProcScr_ArenaUiMain[];
extern struct ProcCmd gProcScr_ArenaUiResults[];
extern struct ProcCmd gProcScr_ArenaUiResultBgm[];

void StartArenaDialogue(int, ProcPtr);
void DrawArenaOpponentDetailsText(ProcPtr);

//! FE8U = 0x080B5730
s8 ArenaUi_IsBgmActive(void) {
    if (!(gMPlayTable[gSongTable[0x38].ms].info->status & 0x8000FFFF)) {
        return 0;
    }

    return 1;
}
