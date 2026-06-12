#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"









/* file-scope type definitions used by this run */


struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

//! FE8U = 0x080C6354
void Title_IDLE(struct TitleScreenProc * proc)
{
    proc->timer_idle++;
    proc->timer = (++proc->timer & 0x3f);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        PlaySoundEffect(SONG_6D);
        SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
        Proc_Break(proc);
    }
    else
    {
        if (proc->timer_idle == 815)
        {
            SetNextGameActionId(GAME_ACTION_CLASS_REEL);
            Proc_Break(proc);
        }
    }
}
