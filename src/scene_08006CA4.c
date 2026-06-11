/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_TalkSpriteShiftClear[];
extern struct ProcCmd gProcScr_TalkLock[];
extern struct ProcCmd gProcScr_TalkShiftClear[];
extern struct TalkState* sTalkState;
extern struct Text sTalkText[];
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

//! FE8U = 0x08006DA0
s8 TalkPrepNextChar(ProcPtr proc) {

    if (!TalkHasCorrectBubble() && sTalkState->activeFaceSlot != 0xFF && !CheckTalkFlag(TALK_FLAG_NOBUBBLE)) {

        if (sTalkState->strBackup == NULL) {
            sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->str, 0) + 7, 8);
        } else {
            sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->strBackup, 0) + 7, 8);
        }

        ClearTalkBubble();

        StartTalkOpen(sTalkState->activeFaceSlot, proc);
        SetTalkFaceLayer(sTalkState->activeFaceSlot, CheckTalkFlag(TALK_FLAG_4));

        return 1;
    }

    if (sTalkState->lineActive >= sTalkState->lines) {
        sTalkState->instantScroll = 0;
        Proc_StartBlocking(gProcScr_TalkShiftClear, proc);
        return 1;
    }

    if (!sTalkState->putLines) {
        PutText(
            TALK_TEXT_BY_LINE(sTalkState->lineActive),
            gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2)
        );

        TalkBgSync(1);

        sTalkState->putLines = 1;
    }

    if (sTalkState->mouthMoveEnabled != 0) {
        SetTalkFaceMouthMove(sTalkState->activeFaceSlot);
    }

    return 0;
}

//! FE8U = 0x08006E8C
s8 TalkSpritePrepNextChar(ProcPtr proc) {

    if (sTalkState->lineActive >= sTalkState->lines) {
        sTalkState->instantScroll = 0;
        Proc_StartBlocking(ProcScr_TalkSpriteShiftClear, proc);
        return 1;
    }

    if (sTalkState->putLines == 0) {
        sTalkState->putLines = 1;
    }

    return 0;
}

//! FE8U = 0x08006EC4
void LockTalk(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_TalkLock, proc);
    return;
}

//! FE8U = 0x08006ED8
s8 IsTalkLocked(void) {
    return Proc_Find(gProcScr_TalkLock) != 0;
}

//! FE8U = 0x08006EF0
void ResumeTalk(void) {
    Proc_EndEach(gProcScr_TalkLock);
    return;
}

//! FE8U = 0x08006F00
void ToggleTalkTextRed(void) {
    int i;

    if (sTalkState->printColor == 1) {
        for (i = 0; i < sTalkState->lines; i++) {
            Text_SetColor(TALK_TEXT_BY_LINE(i), 4);
        }

        sTalkState->printColor = 4;
    } else {

        for (i = 0; i < sTalkState->lines; i++) {
            Text_SetColor(TALK_TEXT_BY_LINE(i), 1);
        }

        sTalkState->printColor = 1;
    }

    return;
}

//! FE8U = 0x08006F8C
void TalkToggleInvertedPalette(int flag) {
    if (flag != 0)
    {
        ApplyPalette(Pal_TalkBubble_Inverted, 3);
        ApplyPalette(Pal_Text_Inverted, 2);
    }
    else
    {
        ApplyPalette(Pal_TalkBubble, 3);
        ApplyPalette(Pal_Text, 2);
    }

    return;
}
