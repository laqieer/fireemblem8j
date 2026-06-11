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

void StartTradeMenuTutorialHandCursor(void);

void TradeMenu_StartTutorialEventLock(struct TradeMenuProc * proc)
{
    Proc_StartBlocking(ProcScr_TradeMenu_TutorialEventLock, proc);
}

void CallTradeTutEventStart(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != TRADE_TUT_NONE)
    {
        CallEvent((void *)EventScr_TradeTutStart, EV_EXEC_QUIET);
        TradeMenu_StartTutorialEventLock(proc);

        StartTradeMenuTutorialHandCursor();
    }
}

void CallTradeTutEventSlectItem(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTut_SelectItem, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}

void CallTradeTutEventPressAtoGetItem(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTut_PressAtoGetItem, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartDoubleTradeMenuTutorialHandCursor();
}

void CallTradeTutEventDone(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTutDone, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}
