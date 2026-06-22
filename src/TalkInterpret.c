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

extern struct TalkState * CONST_DATA sTalkState;
extern struct Text sTalkText[3];

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

extern struct ProcCmd CONST_DATA gProcScr_TalkPause[];
extern struct ProcCmd CONST_DATA gProcScr_TalkShiftClearAll[];
extern struct ChoiceEntryInfo CONST_DATA gYesNoTalkChoice[2];
extern struct ChoiceEntryInfo CONST_DATA gBuySellTalkChoice[2];

//! FE8U = 0x08006ED4
int TalkInterpret(ProcPtr proc) {
    struct Proc* unkProc;
    int i;

    while (1) {
        switch (*sTalkState->str) {
            case CHFE_L_NormalPrint:
            case CHFE_L_FastPrint:
            case CHFE_L_CloseSpeechFast:
                sTalkState->str++;
                sTalkState->activeWidth = 2 + Div(GetStrTalkLen(sTalkState->str, TalkHasCorrectBubble()) + 7, 8);
                continue;
        }
        break;
    }

    switch (*sTalkState->str) {
        case 0x81:
            if (sTalkState->str[1] == 0x40) {
                sTalkState->str += 2;

                Text_Skip(TALK_TEXT_BY_LINE(sTalkState->lineActive), 6);

                if (sTalkState->instantScroll || sTalkState->printDelay <= 0) {
                    return 2;
                }

                unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
                unkProc->unk64 = GetTalkPauseCmdDuration(4);
                return 3;
            }

            return 1;

        case CHFE_L_X:
            if (sTalkState->strBackup == 0) {
                return 0;
            }

            sTalkState->str = sTalkState->strBackup;
            sTalkState->str += 2;
            sTalkState->strBackup = NULL;

            return TalkInterpret(proc);

        case CHFE_L_NL:
            if (sTalkState->putLines == 1 || sTalkState->lineActive == 1) {
                sTalkState->lineActive++;
            }

            sTalkState->putLines = 0;
            sTalkState->str++;
            return 2;

        case CHFE_L_2NL:
            if (CheckTalkFlag(TALK_FLAG_7)) {
                TalkFlushAllLine();
                sTalkState->str++;
            } else if (!CheckTalkFlag(TALK_FLAG_INSTANTSHIFT)) {
                Proc_StartBlocking(gProcScr_TalkShiftClearAll, proc);
            } else {
                ClearTalkText();
            }

            sTalkState->str++;
            return 3;

        case CHFE_L_A:
            StartTalkWaitForInput(
                proc,
                sTalkState->xText * 8 + Text_GetCursor(TALK_TEXT_BY_LINE(sTalkState->lineActive)) + 4,
                sTalkState->yText * 8 + sTalkState->lineActive * 16 + 8
            );

            sTalkState->str++;

            return 3;

        case CHFE_L_Pause8:
        case CHFE_L_Pause16:
        case CHFE_L_Pause32:
        case CHFE_L_Pause64:
            if (sTalkState->instantScroll) {
                sTalkState->str++;
                return 2;
            }

            unkProc = Proc_StartBlocking(gProcScr_TalkPause, proc);
            unkProc->unk64 = GetTalkPauseCmdDuration(*sTalkState->str);

            sTalkState->str++;
            return 3;

        case CHFE_L_CloseSpeechSlow:
            ClearTalkBubble();
            sTalkState->str++;
            return 3;

        case CHFE_L_ToggleMouthMove:
            sTalkState->mouthMoveEnabled = 1 - sTalkState->mouthMoveEnabled;
            sTalkState->str++;
            return 3;

        case CHFE_L_ToggleSmile:
            sTalkState->faceSmileEnabled = 1 - sTalkState->faceSmileEnabled;
            sTalkState->str++;
            return 3;

        case CHFE_L_LoadFace:
            while (1) {
                switch (*sTalkState->str) {
                    case CHFE_L_OpenFarLeft:
                    case CHFE_L_OpenMidLeft:
                    case CHFE_L_OpenLeft:
                    case CHFE_L_OpenRight:
                    case CHFE_L_OpenMidRight:
                    case CHFE_L_OpenFarRight:
                    case CHFE_L_OpenFarFarLeft:
                    case CHFE_L_OpenFarFarRight:
                        SetActiveTalkFace(*sTalkState->str - 8);
                        sTalkState->str++;
                        continue;

                    case CHFE_L_LoadFace:
                        sTalkState->str++;
                        TalkLoadFace(proc);
                        sTalkState->str++;
                        sTalkState->str++;
                        continue;
                }
                break;
            }

            return 3;

        case CHFE_L_ClearFace:
            if (TalkHasCorrectBubble()) {
                ClearTalkBubble();
            }

            StartFaceFadeOut(sTalkState->faces[sTalkState->activeFaceSlot]);
            sTalkState->faces[sTalkState->activeFaceSlot] = 0;
            sTalkState->str++;
            StartTemporaryLock(proc, 16);
            return 3;

        case CHFE_L_SendToBack:
            SetTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case CHFE_L_FastPrint2:
            ClearTalkFlag(TALK_FLAG_4);
            sTalkState->str++;
            return 3;

        case CHFE_L_OpenFarLeft:
        case CHFE_L_OpenMidLeft:
        case CHFE_L_OpenLeft:
        case CHFE_L_OpenRight:
        case CHFE_L_OpenMidRight:
        case CHFE_L_OpenFarRight:
        case CHFE_L_OpenFarFarLeft:
        case CHFE_L_OpenFarFarRight:
            SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

            SetActiveTalkFace(*sTalkState->str - 8);

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case CHFE_L_Yes:
            StartTalkChoice(
                gYesNoTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                1,
                sTalkState->printColor,
                proc
            );

            sTalkState->str++;
            return 3;

        case CHFE_L_No:
            StartTalkChoice(
                gYesNoTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                2,
                sTalkState->printColor,
                proc
            );

            sTalkState->str++;
            return 3;

        case CHFE_L_BuySell:
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                1,
                sTalkState->printColor,
                proc
            );

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case CHFE_L_ShopContinue:
            StartTalkChoice(
                gBuySellTalkChoice,
                TALK_TEXT_BY_LINE(sTalkState->lineActive),
                gBG0TilemapBuffer + TILEMAP_INDEX(sTalkState->xText, sTalkState->yText + sTalkState->lineActive * 2),
                2,
                sTalkState->printColor,
                proc
            );

            while (sTalkState->str++) {
                if (sTalkState->str == sTalkState->str)
                    break;
            }

            return 3;

        case 0x80:
            switch (*++sTalkState->str) {
                case 0x24:
                    if (sTalkState->unk38) {
                        sTalkState->unk38(proc);
                    }

                    sTalkState->str++;
                    return 3;

                case 0x21:
                    ToggleTalkTextRed();
                    sTalkState->str++;
                    return TalkInterpret(proc);

                case 0x00:
                case 0x01:
                case 0x02:
                case 0x03:
                    sTalkState->printColor = *++sTalkState->str;

                    for (i = 0; i < sTalkState->lines; i++) {
                        Text_SetColor(sTalkText + i, sTalkState->printColor);
                    }

                    sTalkState->str++;
                    return 3;
                case 0x25:
                    sTalkState->invertedFlags = 3 - (sTalkState->invertedFlags & 1);
                    sTalkState->str++;
                    return 3;

                case 0x04:
                    LockTalk(proc);
                    sTalkState->str++;
                    return 3;

                case 0x05:
                    NumberToStringAscii(sTalkState->userNumber, sTalkState->userNumberString);

                    sTalkState->str--;

                    sTalkState->strBackup = sTalkState->str;

                    sTalkState->str = sTalkState->userNumberString;

                    return TalkInterpret(proc);

                case 0x20:
                    sTalkState->strBackup = sTalkState->str;
                    sTalkState->strBackup--;
                    sTalkState->str = GetTacticianName();

                    return TalkInterpret(proc);

                case 0x06:
                    sTalkState->str--;

                    sTalkState->strBackup = sTalkState->str;
                    sTalkState->str = sTalkState->userString;

                    return TalkInterpret(proc);
                case 0x0A:
                case 0x0B:
                case 0x0C:
                case 0x0D:
                case 0x0E:
                case 0x0F:
                case 0x10:
                case 0x11:
                    MoveTalkFace(sTalkState->activeFaceSlot, *sTalkState->str - 10);
                    SetActiveTalkFace(*sTalkState->str - 10);

                    sTalkState->str++;
                    return 3;

                case 0x07:
                case 0x08:
                    sTalkState->str++;
                    return 3;

                case 0x16:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 0);
                    return 3;

                case 0x17:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 1);
                    return 3;

                case 0x18:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 3);
                    return 3;

                case 0x19:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 2);
                    return 3;

                case 0x1A:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 4);
                    return 3;

                case 0x1B:
                    sTalkState->str++;
                    SetFaceBlinkControl(sTalkState->faces[sTalkState->activeFaceSlot], 5);
                    return 3;

                case 0x1C:
                    sTalkState->str++;
                    SetFaceEyeControl(sTalkState->faces[sTalkState->activeFaceSlot], 0);
                    return 3;

                case 0x1D:
                    sTalkState->str++;
                    SetFaceEyeControl(sTalkState->faces[sTalkState->activeFaceSlot], 2);
                    return 3;

                case 0x1E:
                    sTalkState->str++;
                    SetFaceEyeControl(sTalkState->faces[sTalkState->activeFaceSlot], 3);
                    return 3;

                case 0x1F:
                    sTalkState->str++;
                    SetFaceEyeControl(sTalkState->faces[sTalkState->activeFaceSlot], 4);
                    return 3;

                default:
                    return 0;
            }
    }

    return 1;
}
