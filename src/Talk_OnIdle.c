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
extern struct TalkState* sTalkState;
extern struct Text sTalkText[];

#define TALK_TEXT_BY_LINE(line) (sTalkText + ((line) + sTalkState->topTextNum) % sTalkState->lines)

//! FE8U = 0x08006C34
void Talk_OnIdle(ProcPtr proc) {

    if (IsTalkFaceMoving()) {
        return;
    }

    if (!sTalkState->instantScroll) {
        sTalkState->printClock++;

        if (sTalkState->printClock < sTalkState->printDelay) {
            return;
        }
    }

    sTalkState->printClock = 0;

    while (1) {
        SetTalkFaceNoMouthMove(sTalkState->activeFaceSlot);

        switch (TalkInterpret(proc)) {
            case 0:
                Proc_Break(proc);
                return;

            case 2:
                if (sTalkState->instantScroll || sTalkState->printDelay <= 0) {
                    break;
                }

                return;

            case 3:
                sTalkState->printClock = sTalkState->printDelay;
                sTalkState->instantScroll = 0;

                return;

            case 1:
            default:
                if (!(CheckTalkFlag(TALK_FLAG_SPRITE))) {
                    if (TalkPrepNextChar(proc) == 1) {
                        return;
                    }
                } else {
                    if (TalkSpritePrepNextChar(proc) == 1) {
                        return;
                    }
                }

                sTalkState->str = Text_DrawCharacter(TALK_TEXT_BY_LINE(sTalkState->lineActive), sTalkState->str);

                if (!CheckTalkFlag(TALK_FLAG_SILENT)) {
                    if (CheckTalkFlag(TALK_FLAG_7)) {
                        PlaySoundEffect(SONG_7A);
                    } else {
                        if ((GetTextDisplaySpeed() == 1) && !(GetGameClock() & 1)) {
                            break;
                        }

                        if (sTalkState->instantScroll && sTalkState->unk82) {
                            break;
                        }

                        sTalkState->unk82 = 1;
                        PlaySoundEffect(SONG_6E);
                    }
                }
        }


        if (!sTalkState->instantScroll && sTalkState->printDelay > 0) {
            return;
        }
    }

    return;
}
