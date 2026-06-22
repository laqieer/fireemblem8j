#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "chapterdata.h"
#include "bm.h"
#include "gamecontrol.h"
#include "event.h"
#include "eventscript.h"
#include "constants/songs.h"

//! FE8U = 0x0800F62C
u8 Event2A_MoveToChapter(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int chIndex = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (chIndex < 0)
        chIndex = (s16)gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_MNTS:
        SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNCH:
        SetNextChapterId(chIndex);

        gPlaySt.save_menu_type = 1;

        SetNextGameActionId(GAME_ACTION_CLASS_REEL);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNC2:
        SetNextChapterId(chIndex);

        gPlaySt.save_menu_type = 2;

        SetNextGameActionId(GAME_ACTION_USR_SKIPPED);
        proc->evStateBits |= EV_STATE_CHANGEGM;

        break;

    case EVSUBCMD_MNC3:
        GotoChapterWithoutSave(chIndex);
        break;

    case EVSUBCMD_MNC4:
        gPlaySt.save_menu_type = 3;
        SetNextGameActionId(GAME_ACTION_PLAYED_THROUGH);
        proc->evStateBits |= EV_STATE_CHANGEGM;
        break;

    } // switch (subcode)

    proc->evStateBits |= EV_STATE_CHANGECH;

    DeleteAll6CWaitMusicRelated();
    Sound_FadeOutBGM(4);

    return EVC_ADVANCE_CONTINUE;
}
