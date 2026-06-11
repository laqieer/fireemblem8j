/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_TalkChoice[];
extern int sTalkChoiceResult;
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

//! FE8U = 0x08007DE8
void StartTalkChoice(const struct ChoiceEntryInfo* choices, struct Text* text, u16 * tm, int defaultChoice, int color, ProcPtr parent) {
    struct TalkChoiceProc* proc;

    int x = Text_GetCursor(text) + 16;

    Text_InsertDrawString(text, x, color, GetStringFromIndex(choices[0].msgid));

    Text_InsertDrawString(text, x + 40, color, GetStringFromIndex(choices[1].msgid));

    PutText(text, tm);

    TalkBgSync(1);

    proc = Proc_StartBlocking(gProcScr_TalkChoice, parent);

    proc->selectedChoice = defaultChoice;

    proc->xDisp = (((tm - gBG0TilemapBuffer) & 0x1f) * 8 - gLCDControlBuffer.bgoffset[0].x) + x;
    proc->yDisp = ((tm - gBG0TilemapBuffer) / 0x20) * 8 - gLCDControlBuffer.bgoffset[0].y;

    proc->choices = choices;

    if (proc->choices[defaultChoice - 1].onSwitchIn) {
        proc->choices[defaultChoice - 1].onSwitchIn();
    }

    return;
}

//! FE8U = 0x08007E9C
void TalkChoice_OnIdle(struct TalkChoiceProc* proc) {

    if (gKeyStatusPtr->newKeys & (B_BUTTON)) {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        sTalkChoiceResult = 0;

        Proc_Break(proc);

        return;
    } else if (gKeyStatusPtr->newKeys & (A_BUTTON)) {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

        sTalkChoiceResult = proc->selectedChoice;

        Proc_Break(proc);

        return;
    }

    if ((gKeyStatusPtr->newKeys & (DPAD_LEFT)) && (proc->selectedChoice == 2)) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);

        proc->selectedChoice = 1;

        if (proc->choices[0].onSwitchIn) {
            proc->choices[0].onSwitchIn();
        }
    }

    if ((gKeyStatusPtr->newKeys & (DPAD_RIGHT)) && (proc->selectedChoice == 1)) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);

        proc->selectedChoice = 2;

        if (proc->choices[1].onSwitchIn) {
            proc->choices[1].onSwitchIn();
        }
    }

    DisplayUiHand(proc->xDisp + (proc->selectedChoice - 1) * 40 - 4, proc->yDisp);

    return;
}

//! FE8U = 0x08007F9C
void TalkShiftClear_OnInit(struct Proc* proc) {

    TileMap_FillRect(
        gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 4),
        sTalkState->activeWidth - 2,
        sTalkState->lines * 2,
        0
    );

    TalkBgSync(1);

    proc->unk64 = 0;

    return;
}

//! FE8U = 0x08007FDC
void TalkShiftClear_OnIdle(struct Proc* proc) {
    int i;

    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= 16) {
        sTalkState->lineActive--;
        sTalkState->topTextNum++;

        BG_SetPosition(0, 0, 0);

        for (i = 0; i < sTalkState->lines - 1; i++) {
            PutText(
                TALK_TEXT_BY_LINE(i),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + 2 * i)
            );
        }

        TileMap_FillRect(
            gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + (sTalkState->lines - 1) * 2),
            sTalkState->activeWidth - 2,
            2,
            0
        );

        ClearText(TALK_TEXT_BY_LINE(sTalkState->lines - 1));
        Text_SetColor(
            TALK_TEXT_BY_LINE(sTalkState->lines - 1),
            sTalkState->printColor
        );

        TalkBgSync(1);

        Proc_Break(proc);
    }

    return;
}
