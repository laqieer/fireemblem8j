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

/* prototypes for same-file helpers called by this run */
void DrawArenaOpponentDetailsText(ProcPtr proc);

//! FE8U = 0x080B5A38
void ArenaUi_ConfirmWager(ProcPtr proc) {
    SetPartyGoldAmount(GetPartyGoldAmount() - ArenaGetMatchupGoldValue());
    PlaySoundEffect(SONG_SE_MONEY);
    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1B, 0x6));
    DrawArenaOpponentDetailsText(proc);

    return;
}
