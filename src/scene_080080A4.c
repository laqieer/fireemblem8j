
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
void ClearPutTalkText(void);
void TalkBgSync(int bg);

//! FE8U = 0x080081A8
void ClearTalkBubble(void) {
    sTalkState->speakingFaceSlot = (s8)0xff;

    BG_Fill(gBG1TilemapBuffer, 0);
    TalkBgSync(2);

    ClearPutTalkText();

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    return;
}
