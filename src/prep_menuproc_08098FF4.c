#include "global.h"

#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"

#include "constants/chapters.h"
#include "constants/songs.h"

s8 CheckInLinkArena(void);

void PrepMenu_CtrlLoop(struct ProcPrepMenu * proc)
{
    struct ProcPrepMenuItem * cmd;
    int index = proc->cur_index;
    int xPos = (proc->xPos + 1) * 8 + 4;
    int yPos = (proc->yPos + 1) * 8 + proc->cur_index * 16;

    ShowSysHandCursor(xPos, yPos, 6, 0x400);

    cmd = proc->cmds[proc->cur_index];

    if (proc->do_help)
    {
        if ((R_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys)
        {
            CloseHelpBox();
            proc->do_help = false;
            return;
        }
    }
    else
    {
        if (R_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (cmd->msg_rtext)
            {
                StartHelpBox(xPos, yPos, cmd->msg_rtext);
                proc->do_help = true;
            }
            return;
        }

        if (A_BUTTON & gKeyStatusPtr->newKeys)
        {
            if ((1 & cmd->color) || (NULL == cmd->effect))
            {
                PlaySoundEffect(SONG_6C);
                return;
            }
            else
            {
                Proc_Goto(proc, 0);
                cmd->effect(proc->proc_parent);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (proc->on_PressB != NULL)
            {
                if (proc->on_PressB(proc->proc_parent))
                {
                    Proc_Goto(proc, 0);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
                }
                else
                {
                    PlaySoundEffect(SONG_6C);
                }
            }
            return;
        }

        if (START_BUTTON & gKeyStatusPtr->newKeys)
        {
            if (proc->on_PressStart != NULL)
            {
                if (proc->on_PressStart(proc->proc_parent))
                {
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    Proc_Goto(proc, 0);
                }
                else
                {
                    PlaySoundEffect(SONG_6C);
                }
            }
            return;
        }
    }

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys)
    {
        if (proc->cur_index)
            proc->cur_index = proc->cur_index - 1;
        else if (DPAD_UP & gKeyStatusPtr->newKeys)
            proc->cur_index = proc->max_index - 1;
    }

    if (DPAD_DOWN & gKeyStatusPtr->repeatedKeys)
    {
        if (proc->cur_index < (proc->max_index - 1))
            proc->cur_index = proc->cur_index + 1;
        else if (DPAD_DOWN & gKeyStatusPtr->newKeys)
            proc->cur_index = 0;
    }

    if (index != proc->cur_index)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if (proc->do_help)
        {
            StartHelpBox(
                (proc->xPos + 1) * 8 + 4, (proc->yPos + 1) * 8 + proc->cur_index * 16,
                (cmd = proc->cmds[proc->cur_index])->msg_rtext);
        }
    }
}
