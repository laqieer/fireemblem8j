#include "global.h"

#include "constants/items.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "sysutil.h"
#include "bm.h"
#include "bmitem.h"
#include "bmtrade.h"
#include "bmunit.h"
#include "bmmind.h"
#include "m4a.h"
#include "uimenu.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/songs.h"

EWRAM_DATA struct TradeMenuProc * gpTradeMenuProc = NULL;













CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialWait[] = {
    PROC_CALL(TradeMenu_TutorialWait_OnInit),
    PROC_REPEAT(TradeMenu_TutorialWait_OnLoop),

    PROC_END
};



/* prototypes for same-file helpers called by this run */
void CallTradeTutEventSlectItem(struct TradeMenuProc * proc);
void CallTradeTutEventPressAtoGetItem(struct TradeMenuProc * proc);
void CallTradeTutEventDone(struct TradeMenuProc * proc);

void TradeMenuHandSTAL(struct Proc * ee)
{
    if (gpTradeMenuProc->tradeTutorialState != 3 && gpTradeMenuProc->tradeTutorialState != 5 && gpTradeMenuProc->tradeTutorialState != 8)
    {
        Proc_StartBlocking(ProcScr_TradeMenu_TutorialWait, ee);
    }
}

s8 TradeMenu_UpdateTutorial(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != 4 && (gKeyStatusPtr->newKeys == 0))
        return FALSE;

    switch (gpTradeMenuProc->tradeTutorialState) {
    case 2:
        if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
            CallTradeTutEventSlectItem(proc);

            return FALSE;
        }

        PlaySoundEffect(SONG_6C);

        Proc_Goto(proc, L_TRADEMENU_LOADFORCED);

        return TRUE;

    case 3:
        if (!(gKeyStatusPtr->newKeys & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gKeyStatusPtr->newKeys & A_BUTTON))
                return FALSE;

            if (!(gKeyStatusPtr->newKeys & (DPAD_UP | DPAD_DOWN)))
            {
                if (GetItemIndex(proc->units[proc->hoverColumn]->items[proc->hoverRow]) == ITEM_VULNERARY)
                {
                    SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
                    SetTradeMenuTutStatus4();

                    return FALSE;
                }
            }
        }

        PlaySoundEffect(SONG_6C);

        CallTradeTutEventSlectItem(proc);

        return TRUE;

    case 5:
        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            CallTradeTutEventDone(proc);

            return FALSE;
        }

        PlaySoundEffect(SONG_6C);

        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 4:
        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 8:
        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            SetKeyStatus_IgnoreMask(0);
            ClearFlag(0x87); // TODO: EID/FLAG DEFINTIONS

            return FALSE;
        }

        PlaySoundEffect(SONG_6C);

        CallTradeTutEventDone(proc);

        return TRUE;

    default:
        return FALSE;

    } // switch (gpTradeMenuProc->tradeTutorialState)
}

void SetTradeMenuTutStatus2(void)
{
    gpTradeMenuProc->tradeTutorialState = 2;
}

void SetTradeMenuTutStatus3(void)
{
    gpTradeMenuProc->tradeTutorialState = 3;
}

void SetTradeMenuTutStatus4(void)
{
    gpTradeMenuProc->tradeTutorialState = 4;
}

void SetTradeMenuTutStatus5(void)
{
    gpTradeMenuProc->tradeTutorialState = 5;
}

void SetTradeMenuTutStatus6(void)
{
    gpTradeMenuProc->tradeTutorialState = 6;
}

void SetTradeMenuTutStatus7(void)
{
    gpTradeMenuProc->tradeTutorialState = 7;
}

void SetTradeMenuTutStatus8(void)
{
    gpTradeMenuProc->tradeTutorialState = 8;
}
