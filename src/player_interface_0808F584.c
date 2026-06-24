#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "player_interface.h"

/* JP-specific inline Shift-JIS goal strings, bound at their ROM rodata addrs */
extern const char GoalString_UnitsLeft[];  /* 081F5528 "残り" */
extern const char GoalString_LastTurn[];   /* 081F5530 "最終ターン" */
extern const char GoalString_Turn[];       /* 081F553C "ターン" */

//! FE8U = 0x0808D2A8
void GoalDisplay_Init(struct PlayerInterfaceProc * proc)
{
    int goalTextId;
    int goalWindowType;
    int turnNumber;
    int lastTurnNumber;
    char * str;
    struct Text * text;

    proc->showHideClock = 0;
    proc->isRetracting = false;
    proc->cursorQuadrant = 0;
    proc->windowQuadrant = -1;

    InitText(&proc->texts[0], 8);
    InitText(&proc->texts[1], 8);

    StartGreenText(proc);

    ClearText(&proc->texts[0]);
    ClearText(&proc->texts[1]);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
    {
        goalTextId = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowTextId;
    }
    else
    {
        goalTextId = 0x126;
    }

    str = GetStringFromIndex(goalTextId);
    Text_InsertDrawString(&proc->texts[0], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_WHITE, str);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
    {
        goalWindowType = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowDataType;
    }
    else
    {
        goalWindowType = GOAL_TYPE_DEFEAT_ALL;
    }

    switch (goalWindowType)
    {
    case GOAL_TYPE_SEIZE:
    case GOAL_TYPE_DEFEAT_BOSS:
    case GOAL_TYPE_SPECIAL:
        proc->unitClock = 0;

        return;

    case GOAL_TYPE_DEFEAT_ALL:
        Text_InsertDrawString(&proc->texts[1], 20, TEXT_COLOR_SYSTEM_WHITE, GoalString_UnitsLeft);

        if (gPlaySt.chapterVisionRange != 0)
        {
            Text_InsertDrawString(&proc->texts[1], 36, TEXT_COLOR_SYSTEM_GRAY, GetStringFromIndex(0x4C5));
        }
        else
        {
            Text_InsertDrawNumberOrBlank(
                &proc->texts[1], 44, TEXT_COLOR_SYSTEM_BLUE, CountUnitsByFaction(FACTION_RED));
        }

        break;

    case GOAL_TYPE_DEFENSE:
        turnNumber = gPlaySt.chapterTurnNumber;

        if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
        {

            if (turnNumber >= (GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowEndTurnNumber - 1))
            {
                goto _0808F6D0;
            }
        }
        else
        {
            if (turnNumber >= -1)
            {
            _0808F6D0:
                str = (char *)GoalString_LastTurn;
                Text_InsertDrawString(
                    &proc->texts[1], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_GREEN, str);

                break;
            }
        }

        Text_InsertDrawNumberOrBlank(&proc->texts[1], 10, TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);
        Text_InsertDrawString(
            &proc->texts[1], 18, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(0x4C9));

        text = &proc->texts[1];

        if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
        {
            lastTurnNumber = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowEndTurnNumber - 1;
        }
        else
        {
            lastTurnNumber = -1;
        }

        Text_InsertDrawNumberOrBlank(text, 34, TEXT_COLOR_SYSTEM_BLUE, lastTurnNumber);
        Text_InsertDrawString(&proc->texts[1], 42, TEXT_COLOR_SYSTEM_WHITE, GoalString_Turn);

        break;

    default:
        return;
    }

    proc->unitClock = 1;

    return;
}
