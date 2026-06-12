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



extern int CONST_DATA gUnkData_59[];





//! FE8U = 0x080A0724
void FortuneSubMenu_StartText(struct PrepProcA1962C* proc) {
    StartCgText(10, 7, 17, 4, proc->unk_2c, OBJ_VRAM0 + 0x1000, -1, 0);
    SetCgTextFlags(CG_TEXT_FLAG_2 | CG_TEXT_FLAG_3 | CG_TEXT_FLAG_4 | CG_TEXT_FLAG_5 | CG_TEXT_FLAG_6); 
    return;
}
