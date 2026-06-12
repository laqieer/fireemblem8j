
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


extern struct TalkState* CONST_DATA sTalkState;
static struct Text sTalkText[3];

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
void TalkToggleInvertedPalette(int flag);
void StartOpenTalkBubble(void);
void InitTalkTextWin(int x, int y, int width, int height);
void PutTalkBubbleTail(int bg, int x, int y, int kind);
void PutTalkBubbleTm(int bg, int x, int y, int width, int height);
void TalkBgSync(int bg);

//! FE8U = 0x080082A4
void PutTalkBubble(int xAnchor, int yAnchor, int width, int height) {
    int y;
    int kind;

    int xTail = 0;
    int x = 0;

    BG_Fill(gBG1TilemapBuffer, 0);

    if (xAnchor < 16) {
        kind = 0;
    } else {
        kind = 1;
    }

    if ((s8)IsBattleDeamonActive()) {
        kind += 2;
    }

    y = (yAnchor - height) + 1;

    switch (kind) {
        case 0:
            xTail = xAnchor + 3;

            x = xTail - width / 2;

            if (x < 1) {
                x = 1;
            }

            break;

        case 1:
            xTail = xAnchor - 5;

            if ((width + 1) / 2 + xTail >= 30) {
                x = 0x1d - width;

            } else {
                x = xTail - width / 2;
            }

            break;

        case 2:
            x = 9;
            y = 14;
            width = 20;
            xTail = 8;
            yAnchor = 16;

            break;

        case 3:
            x = 1;
            y = 14;
            width = 20;
            xTail = 20;
            yAnchor = 16;

            break;
    }

    sTalkState->xText = x + 1;
    sTalkState->yText = y + 1;

    PutTalkBubbleTm(BG_1, x, y, width, height);

    if (sTalkState->invertedFlags & 2) {
        TalkToggleInvertedPalette(sTalkState->invertedFlags & 1);
        sTalkState->invertedFlags ^= 2;
    }

    if (!(sTalkState->invertedFlags & 1)) {
        PutTalkBubbleTail(BG_1, xTail, yAnchor, kind);
    }

    InitTalkTextWin(x, y, width, height);

    StartOpenTalkBubble();

    TalkBgSync(2);

    return;
}
