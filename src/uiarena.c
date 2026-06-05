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

//! FE8U = 0x080B5B9C
void ArenaUi_ShowGoldBoxOnVictoryOrDraw(ProcPtr proc) {

    switch (ArenaGetResult()) {
        case 1:
        case 3:
            DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1B, 0x6));
            PlaySoundEffect(SONG_SE_MONEY);
            StartTemporaryLock(proc, 60);

            break;

        case 2:
            return;
    }

    return;
}

//! FE8U = 0x080B5BE4
void ArenaUi_OnEnd(void) {
    Proc_EndEach(gProcScr_GoldBox);
    Proc_ForEach(ProcScr_Mu, (ProcFunc) ShowMu);
    return;
}

//! FE8U = 0x080B5C04
void StartArenaDialogue(int msgId, ProcPtr proc) {

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);
    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);

    return;
}

//! FE8U = 0x080B5C48
void DrawArenaOpponentDetailsText(ProcPtr proc) {

    DrawUiFrame2(7, 9, 0x10, 6, 0);
    SetTextFont(0);
    InitSystemTextFont();

    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 10), 0, GetStringFromIndex(gMid_Lv));
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 10), 2, gArenaState.opponentUnit->level);
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 12), 0, GetStringFromIndex(gArenaState.opponentUnit->pCharacterData->nameTextId));
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 10), 0, GetStringFromIndex(gArenaState.opponentUnit->pClassData->nameTextId));
    PutString(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12), 0, GetItemName(gArenaState.opponentWeapon));

    return;
}

//! FE8U = 0x080B5CE0
void Arena_PlayResultSong(ProcPtr proc) {
    switch (ArenaGetResult()) {
        case 1:
            if (!gPlaySt.config.disableBgm) {
                StartBgmCore(SONG_COLOSSEUM_VICTORY, 0);
            }

            break;

        default:
            if (!gPlaySt.config.disableBgm) {
                StartBgmCore(SONG_COLOSSEUM_ENTRANCE, 0);
            }

            Proc_End(proc);

            break;
    }

    return;
}

//! FE8U = 0x080B5D2C
void Arena_PlayArenaSong(void) {
    StartBgmExt(SONG_COLOSSEUM_ENTRANCE, 0, 0);
    return;
}
