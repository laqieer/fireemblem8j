#include "global.h"
#include "face.h"

/* Forward declarations */
struct TalkState;

struct TalkState
{
    /* 00 */ const char* str;
    /* 04 */ const char* strBackup;
    /* 08 */ u8 printColor;
    /* 09 */ u8 lineActive;
    /* 0A */ u8 lines;
    /* 0B */ u8 topTextNum;
    /* 0C */ u8 xText;
    /* 0D */ u8 yText;
    /* 0E */ u8 activeWidth;
    /* 0F */ s8 speakingFaceSlot;
    /* 10 */ u8 speakingWidth;
    /* 11 */ u8 activeFaceSlot;
    /* 12 */ s8 instantScroll;
    /* 13 */ s8 printDelay;
    /* 14 */ s8 printClock;
    /* 15 */ u8 putLines;
    /* 16 */ u8 mouthMoveEnabled;
    /* 17 */ u8 faceSmileEnabled;
    /* 18 */ struct FaceProc* faces[8];
};

extern struct TalkState* sTalkState;
void StartTalkFaceMove(int talkFaceFrom, int talkFaceTo, int isSwap);

void MoveTalkFace(int talkFaceFrom, int talkFaceTo)
{
    struct FaceProc* face;
    int isSwap = 0;

    if (sTalkState->faces[talkFaceTo] != 0) {
        isSwap = 1;
        StartTalkFaceMove(talkFaceTo, talkFaceFrom, 1);
    }

    StartTalkFaceMove(talkFaceFrom, talkFaceTo, isSwap);

    face = sTalkState->faces[talkFaceFrom];
    sTalkState->faces[talkFaceFrom] = sTalkState->faces[talkFaceTo];
    sTalkState->faces[talkFaceTo] = face;
}
