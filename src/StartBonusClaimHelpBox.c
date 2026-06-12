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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_BonusClaimHelpBox[];

struct BonusClaimHelpBoxProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int x;
    /* 30 */ int y;
    /* 34 */ STRUCT_PAD(0x34, 0x58);

    /* 58 */ int msgId;
};

// clang-format on

//! FE8U = 0x080AEBCC
void StartBonusClaimHelpBox(int x, int y, int msgId, ProcPtr parent)
{
    struct BonusClaimHelpBoxProc * proc = Proc_StartBlocking(gProcScr_BonusClaimHelpBox, parent);
    proc->x = x;
    proc->y = y;
    proc->msgId = msgId;

    return;
}
