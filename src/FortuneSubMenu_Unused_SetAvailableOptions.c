extern int IsAuguryDivinationAvailable();
extern int IsTacticianDivinationAvailable();
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

//! FE8U = 0x080A0760
void FortuneSubMenu_Unused_SetAvailableOptions(struct PrepProcA1962C* proc) {
    proc->unk_30[0] = 1;
    proc->unk_30[1] = IsTacticianDivinationAvailable();
    proc->unk_30[2] = IsAuguryDivinationAvailable();
    proc->unk_30[3] = 1;
    return;
}
