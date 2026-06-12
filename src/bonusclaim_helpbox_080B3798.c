#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "bmsave.h"
#include "ap.h"
#include "sysutil.h"
#include "constants/songs.h"

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int msgId;
};

//! FE8U = 0x080AEB60
void BonusClaimHelp_Init(struct BonusClaimHelpBoxProc * proc)
{
    PlaySoundEffect(SONG_70);
    StartHelpBox_Unk(proc->x, proc->y, proc->msgId);
    return;
}
