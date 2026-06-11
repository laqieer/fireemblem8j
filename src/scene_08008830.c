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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_Talk[];
extern u16 gSprite_TalkTextBack[];
extern u16 gSprite_TalkTextFront[];
extern int gTalkFaceHPosLut[];
extern int sTalkChoiceResult;
extern struct Font sTalkFont;
extern struct TalkState* sTalkState;

//! FE8U = 0x08008934
int GetTalkFaceHPos(int talkFace) {

    if ((s8)IsBattleDeamonActive()) {
        if (talkFace < 3) {
            return 4;
        } else {
            return 26;
        }
    }

    return gTalkFaceHPosLut[talkFace];
}

//! FE8U = 0x08008960
void SetTalkFaceDisp(int talkFace, int faceDisp) {
    const int lut[] = { 0, FACE_DISP_SMILE };

    int disp;

    if (talkFace == 0xff) {
        return;
    }

    disp = GetFaceDisplayBits(sTalkState->faces[talkFace]);
    disp &= ~(FACE_DISP_SMILE | FACE_DISP_TALK_1 | FACE_DISP_TALK_2);

    SetFaceDisplayBits(sTalkState->faces[talkFace], disp | faceDisp | lut[sTalkState->faceSmileEnabled]);

    return;
}

//! FE8U = 0x080089B8
void SetTalkFaceMouthMove(int talkFace) {
    SetTalkFaceDisp(talkFace, FACE_DISP_TALK_1);
    return;
}

//! FE8U = 0x080089C4
void SetTalkFaceNoMouthMove(int talkFace) {
    SetTalkFaceDisp(talkFace, 0);
    return;
}

//! FE8U = 0x080089D0
s8 IsTalkActive(void) {
    return Proc_Find(gProcScr_Talk) ? 1 : 0;
}

//! FE8U = 0x080089E8
s8 FaceExists(void) {
    return Proc_Find(gProcScr_E_FACE) ? 1 : 0;
}

//! FE8U = 0x08008A00
int GetTalkChoiceResult(void) {
    return sTalkChoiceResult;
}

//! FE8U = 0x08008A0C
int SetTalkChoiceResult(int result) {
    sTalkChoiceResult = result;
    // return; // BUG
}

//! FE8U = 0x08008A18
void SetTalkNumber(int number) {
    sTalkState->userNumber = number;
    return;
}

//! FE8U = 0x08008A24
void SetTalkUnkStr(const char* str) {
    strcpy(sTalkState->userString, str);
    return;
}

void PrintStringToTexts(struct Text** texts, const char* str, u16 * tm, int unk) {
    int uh;

    int line = 0;

    while (1) {
        uh = 0;

        switch (*str) {
            case 0:
                uh += 1;
                break;

            case 1:
                PutText(texts[line], tm + line * 0x40);

                line++;
                str++;

                if (line >= unk) {
                    return;
                }

                break;
        }

        if (uh != 0) {
            break;
        }

        str = Text_DrawCharacter(texts[line], str);
        continue;
    }

    PutText(texts[line], tm + line * 0x40);

    return;
}

//! FE8U = 0x08008AA8
void TalkPutSpriteText_OnIdle(struct Proc* proc) {

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextBack,
        OAM2_CHR(proc->unk52) | OAM2_PAL(proc->unk64)
    );

    PutSprite(
        3,
        proc->x,
        proc->y,
        gSprite_TalkTextFront,
        OAM2_CHR(proc->unk52) | OAM2_PAL(sTalkFont.palid)
    );

    return;
}

//! FE8U = 0x08008B24
void ClearPrimaryHBlank(void) {
    SetPrimaryHBlankHandler(NULL);
    return;
}

//! FE8U = 0x08008B30
void TalkPutSpriteText_OnEnd(void) {
    CallDelayed(ClearPrimaryHBlank, 1);
    return;
}
