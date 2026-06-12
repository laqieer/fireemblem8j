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

//! FE8U = 0x080B734C
void EndingBattleText_Loop(struct EndingBattleTextProc * proc)
{
    if ((gKeyStatusPtr->newKeys & START_BUTTON) && (CheckGameEndFlag() != 0))
    {
        Proc_Break(proc);
        Proc_Goto(proc->proc_parent, 100);
        return;
    }

    if (proc->pauseTimer != 0)
    {
        proc->pauseTimer--;
        return;
    }

    SetTextFont(NULL);

    switch (*proc->str)
    {
        case CHFE_L_X: // [X]
            Proc_Break(proc);
            break;

        case CHFE_L_NL: // [NL]
            proc->str++;
            proc->text++;
            proc->pauseTimer += 16;

            Text_SetCursor(proc->text, 0);
            Text_SetColor(proc->text, 0);

            break;

        case CHFE_L_Pause8: // [....]
            proc->pauseTimer = 8;
            proc->str++;

            break;

        case CHFE_L_Pause16: // [.....]
            proc->pauseTimer = 16;
            proc->str++;

            break;

        case CHFE_L_Pause32: // [......]
            proc->pauseTimer = 32;
            proc->str++;

            break;

        case CHFE_L_Pause64: // [.......]
            proc->pauseTimer = 64;
            proc->str++;

            break;

        case CHFE_L_2NL: // [NL2]
        case CHFE_L_A: // [A]
        default:
            proc->str = Text_DrawCharacter(proc->text, proc->str);
    }

    // TODO: Is this a bug? Seems to overwrite any pauses with the default delay of 4 frames...
    proc->pauseTimer = proc->defaultPauseDelay;

    return;
}
