#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"

extern EWRAM_DATA struct CgTextSt gCgTextSt;

// clang-format off





//! FE8U = 0x08090014
void YesNoChoice_Loop_KeyHandler(struct YesNoChoiceProc * proc)
{
    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        SetTalkChoiceResult(TALK_CHOICE_CANCEL);
        Proc_Break(proc);
        return;
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        SetTalkChoiceResult(proc->currentChoice);
        Proc_Break(proc);
        return;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_LEFT) && (proc->currentChoice == TALK_CHOICE_NO))
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        proc->currentChoice = TALK_CHOICE_YES;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) && (proc->currentChoice == TALK_CHOICE_YES))
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        proc->currentChoice = TALK_CHOICE_NO;
    }

    DisplayUiHand(proc->x + (proc->currentChoice - 1) * 40 - 4, proc->y);

    return;
}
