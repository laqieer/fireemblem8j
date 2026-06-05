#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"













void CallBattleQuoteEvent(u16 textIndex) {
    // Battle quote (unused?)
    CallEvent((u16 *)EventScr_DisplayBattleQuote, EV_EXEC_GAMEPLAY);

    gEventSlots[0x02] = textIndex;
}

void CallBattleQuoteEventInBattle(u16 textIndex) {
    // Battle quote
    EventEngine_CreateBattle((u16 *)EventScr_DisplayBattleQuote);

    gEventSlots[0x2] = textIndex;
}

void CallTileChangeEvent(u16 tileChangeIndex) {
    // Generic tile change events?
    CallEvent((u16 *)EventScr_TriggerQueuedTileChanges, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
}

void CallChestOpeningEvent(u16 tileChangeIndex, u16 idr) {
    // Chest opening events?
    CallEvent((u16 *)EventScr_OpenChest, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
    gEventSlots[0x3] = idr;
}

void CallMapSupportEvent(u16 musicIndex, u16 textIndex) {
    // Calls text with music (just quiets music when id is 0)
    // On-map supports?
    CallEvent((u16 *)EventScr_MapSupportConversation, EV_EXEC_CUTSCENE);

    gEventSlots[0x2] = musicIndex;
    gEventSlots[0x3] = textIndex;
}

void CallSupportViewerEvent(u16 textIndex) {
    // Calls text with random background (support viewer?)
    CallEvent((u16 *)EventScr_SupportViewerConversation, EV_EXEC_QUIET);

    gEventSlots[0x2] = textIndex;
}

void CallRetreatPromptEvent(void) {
    // Calls Retreat events
    CallEvent((u16 *)EventScr_SkirmishRetreat, EV_EXEC_CUTSCENE);

    gEventSlots[0x2] = gPlaySt.chapterIndex;
}

void CallSuspendPromptEvent(void) {
    // Calls Suspend events
    CallEvent((u16 *)EventScr_SuspendPrompt, EV_EXEC_CUTSCENE);
}

void CallGameOverEvent(void) {
    // Calls Game Over
    EventEngine_Create((u16 *)EventScr_GameOver, EV_EXEC_GAMEPLAY);
}
