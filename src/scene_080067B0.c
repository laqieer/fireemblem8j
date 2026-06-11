/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_Talk[];
extern struct Font sTalkFont;
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

int SetActiveTalkFace(int slot);

//! FE8U = 0x080068AC
void InitSpriteTalk(int chr, int lines, int palId) {
    int i;

    InitSpriteTextFont(&sTalkFont, (void*)(0x06010000 + (0x3FF & chr) * CHR_SIZE), palId);

    SetTextFont(&sTalkFont);
    SetTextFontGlyphs(TEXT_GLYPHS_TALK);

    ApplyPalette(Pal_TalkText, palId + 0x10);

    PAL_OBJ_COLOR(palId, 4) = RGB(7, 18, 28);
    PAL_OBJ_COLOR(palId, 14) = RGB(14, 13, 12);
    PAL_OBJ_COLOR(palId, 15) = RGB(31, 31, 31);

    sTalkState->lines = lines;

    for (i = 0; i < lines; i++) {
        InitSpriteText(sTalkText + i);

        SpriteText_Clear(sTalkText + i);
        Text_SetColor(sTalkText + i, 0);
        Text_SetCursor(sTalkText + i, 4);
    }

    return;
}

//! FE8U = 0x08006964
void ApplyTalkTextPalette(void) {
    ApplyPalette(Pal_Text, 2);
    return;
}

//! FE8U = 0x08006978
void SetInitTalkTextFont(void) {
    SetTextFont(&sTalkFont);
    InitTalkTextFont();

    return;
}

//! FE8U = 0x0800698C
ProcPtr StartTalkExt(int x, int y, const char* str, ProcPtr parent) {
    sTalkState->xText = x;
    sTalkState->yText = y;

    sTalkState->str = str;
    sTalkState->strBackup = NULL;

    sTalkState->printColor = 1;
    sTalkState->lineActive = 0;
    sTalkState->unk82 = 0;
    sTalkState->topTextNum = 0;
    sTalkState->printDelay = GetTextDisplaySpeed();
    sTalkState->printClock = 0;

    SetActiveTalkFace(0xff);

    sTalkState->speakingFaceSlot = (s8)0xff;
    sTalkState->putLines = 0;
    sTalkState->instantScroll = 0;
    sTalkState->mouthMoveEnabled = 1;
    sTalkState->faceSmileEnabled = 0;

    sTalkState->config = 0;

    sTalkState->unk38 = NULL;
    sTalkState->invertedFlags = 0;

    sTalkState->activeWidth = Div(GetStrTalkLen(sTalkState->str, 0) + 7, 8) + 2;

    if (parent) {
        return Proc_StartBlocking(gProcScr_Talk, parent);
    } else {
        return Proc_Start(gProcScr_Talk, PROC_TREE_3);
    }
}
