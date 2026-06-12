#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

void DrawChapterStatusTextForUnit(struct Unit * unit);

//! FE8U = 0x0808E608
void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc * proc)
{
    int previous = proc->unitIndex;

    proc->helpTextActive = false;

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        proc->helpTextActive = true;
        StartChapterStatusHelpBox(proc);

        return;
    }
    else if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if ((proc->units[proc->unitIndex] != NULL) && !(proc->units[proc->unitIndex]->state & (US_UNDER_A_ROOF | US_BIT9)))
        {
            SetLastStatScreenUid(proc->units[proc->unitIndex]->index);
            proc->focusUnitOnExit = true;
        }

        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        Proc_Goto(proc, 1);

        return;
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 1);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && (proc->unitIndex != 0))
    {
        proc->unitIndex--;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && (proc->unitIndex == 0))
    {
        proc->unitIndex++;
    }

    if (proc->unitIndex != previous)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);
    }

    return;
}
