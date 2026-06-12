#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "chapterdata.h"
#include "cgtext.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "constants/songs.h"

/**
* This proc seems to be the "sub-menu" dialogue that pops up when selecting "Fortune" on the prep screen in FE7.
* In FE8, most of the functionality has been dummied out, and this proc goes directly to the support screen.
*/

struct PrepProcA1962C {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2C */ int unk_2c;
    /* 30 */ s8 unk_30[4];
};

s8 IsTacticianDivinationAvailable(void);
s8 IsAuguryDivinationAvailable(void);

void FortuneSubMenu_Init_Null(void);
void FortuneSubMenu_OnOptionSelected(ProcPtr);
void FortuneSubMenu_HandleOptionSwitch(struct PrepProcA1962C*);
void StartSupportScreenFromPrepScreen(ProcPtr);

struct ProcCmd CONST_DATA gProcScr_FortuneSubMenu[] = {
    PROC_SLEEP(0),

    PROC_CALL(FortuneSubMenu_Init_Null),

PROC_LABEL(0),
    PROC_CALL(FortuneSubMenu_HandleOptionSwitch),

    // fallthrough

PROC_LABEL(1),
PROC_LABEL(2),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),

    PROC_GOTO(5),

PROC_LABEL(3),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),

    PROC_GOTO(5),

PROC_LABEL(4),
    PROC_CALL(FortuneSubMenu_OnOptionSelected),
    PROC_CALL(StartSupportScreenFromPrepScreen),

    PROC_SLEEP(0),

    PROC_GOTO(5),

PROC_LABEL(5),
    PROC_END,
};

extern int CONST_DATA gUnkData_59[];





//! FE8U = 0x080A0944
void StartFortuneSubMenu(int option, ProcPtr parent) {
    struct PrepProcA1962C* proc = Proc_StartBlocking(gProcScr_FortuneSubMenu, parent);
    proc->unk_29 = option;
    return;
}
