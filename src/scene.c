
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
struct TalkState* CONST_DATA sTalkState = &sTalkStateCore;
static struct Text sTalkText[3];























































//! FE8U = 0x08006AC8
void ClearTalkFlag(int flag) {
    sTalkState->config &= ~flag;
    return;
}

//! FE8U = 0x08006ADC
int CheckTalkFlag(int flag) {
    return sTalkState->config & flag;
}

//! FE8U = 0x08006AF0
void SetTalkPrintDelay(int printDelay) {

    sTalkState->printDelay = printDelay;

    if (sTalkState->printDelay < 0) {
        sTalkState->printDelay = 0;
    }

    return;
}
