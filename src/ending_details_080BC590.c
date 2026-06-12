#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"


extern EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2];













extern u16 * CONST_DATA gSoloEndingBattleDispConf[];



/* prototypes for same-file helpers called by this run */
int HandleTurnRecordText(struct ChapterStats * chapterStats, int displayId);

//! FE8U = 0x080B7B30
void TurnRecord_Loop_Main(struct EndingTurnRecordProc * proc)
{
    int y = proc->yPos >> 6;

    BG_SetPosition(BG_1, 0, y - 136);

    if ((y & 15) == 0)
    {
        if (proc->displayId == (y / 16))
        {
            if (proc->chapterId >= proc->chapterStatsIdx)
            {
                int unk = proc->chapterId - proc->chapterStatsIdx;

                if (unk == 1)
                {
                    HandleTurnRecordText((void *)-1, proc->displayId);
                }
                else if (unk >= 3)
                {
                    Proc_Break(proc);
                }
                else
                {
                    HandleTurnRecordText(NULL, proc->displayId);
                }
            }
            else
            {
                proc->chapterId += HandleTurnRecordText(GetChapterStats(proc->chapterId), proc->displayId);
            }

            proc->chapterId++;
            proc->displayId++;
        }
    }

    if (gKeyStatusPtr->heldKeys & A_BUTTON)
    {
        // Double scrolling speed if holding the A Button
        proc->yPos += proc->yScrollAmt;
    }

    proc->yPos += proc->yScrollAmt;

    return;
}
