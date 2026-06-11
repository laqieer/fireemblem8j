
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

// various bits of the box opening animation
extern u8 CONST_DATA Img_TalkBubbleOpening_A[];
extern u8 CONST_DATA Img_TalkBubbleOpening_B[];
extern u8 CONST_DATA Img_TalkBubbleOpening_C[];
extern u8 CONST_DATA Img_TalkBubbleOpening_D[];
extern u8 CONST_DATA Img_TalkBubbleOpening_E[];
extern u8 CONST_DATA Img_TalkBubble[];

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

static struct TalkState sTalkStateCore;
extern struct TalkState* CONST_DATA sTalkState;
static struct Text sTalkText[3];
static int sTalkChoiceResult;
static struct Font sTalkFont;

extern struct ProcCmd CONST_DATA gProcScr_TalkSkipListener[];

extern struct ProcCmd CONST_DATA gProcScr_Talk[];

extern struct ProcCmd CONST_DATA gProcScr_TalkLock[];

extern struct FaceVramEntry CONST_DATA FaceConfig_FightEvent[4];





extern struct ProcCmd CONST_DATA gProcScr_TalkWaitForInput[];







extern const u16* CONST_DATA gPressKeyArrowSpriteLut[];

extern struct ProcCmd CONST_DATA gProcScr_TalkShiftClearAll[];





extern struct ProcCmd CONST_DATA gProcScr_TalkChoice[];

extern struct ProcCmd CONST_DATA gProcScr_TalkShiftClear[];

extern struct ProcCmd CONST_DATA ProcScr_TalkSpriteShiftClear[];

extern int CONST_DATA gTalkPauseDurations[4];



extern struct ProcCmd CONST_DATA gProcScr_TalkOpen[];

extern int CONST_DATA gTalkFaceHPosLut[8];

extern u16 CONST_DATA gSprite_TalkTextFront[];

extern u16 CONST_DATA gSprite_TalkTextBack[];



extern struct ProcCmd CONST_DATA ProcScr_Scene_0[];

extern struct ProcCmd CONST_DATA ProcScr_Scene_1[];

extern struct ProcCmd CONST_DATA ProcScr_ScreenFlashing[];

/* prototypes for same-file helpers called by this run */
void EndTalk(void);
int CheckTalkFlag(int flag);
void SetTalkFaceNoMouthMove(int talkFace);

//! FE8U = 0x08006B10
void SetTalkPrintColor(int color) {
    int i;

    sTalkState->printColor = color;

    for (i = 0; i < sTalkState->lines; i++) {
        Text_SetColor(sTalkText + i, sTalkState->printColor);
    }

    return;
}

//! FE8U = 0x08006B4C
void TalkSkipListener_OnIdle(ProcPtr proc) {

    if (Proc_Find(gProcScr_TalkShiftClearAll) != NULL) {
        return;
    }

    if (Proc_Find(gProcScr_TalkShiftClear) != NULL) {
        return;
    }

    if (!CheckTalkFlag(TALK_FLAG_NOSKIP) && (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON))) {
        SetDialogueSkipEvBit();
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        Proc_End(proc);
        EndTalk();

        BG_Fill(gBG0TilemapBuffer, 0);
        BG_Fill(gBG1TilemapBuffer, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        return;
    }

    if (Proc_Find(gProcScr_TalkWaitForInput) != 0) {
        return;
    }

    if (!CheckTalkFlag(TALK_FLAG_NOFAST) && (gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON))) {
        sTalkState->instantScroll = 1;
    }

    return;
}

//! FE8U = 0x08006C00
void Talk_OnInit(void) {

    if (!CheckTalkFlag(TALK_FLAG_SPRITE)) {
        LoadObjUIGfx();

        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
    }

    Proc_Start(gProcScr_TalkSkipListener, PROC_TREE_3);

    return;
}
