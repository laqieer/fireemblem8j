#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"


extern EWRAM_OVERLAY(0) u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT];









































extern struct ProcCmd CONST_DATA ProcScr_Mu[];









extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];







extern struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[];





/* prototypes for same-file helpers called by this run */
void EndMuMovement(struct MuProc * proc);

void HaltMu(struct MuProc * proc)
{
    EndMuMovement(proc);
    proc->state = MU_STATE_INACTIVE;
}

void LockMus(void)
{
    Proc_BlockEachMarked(PROC_MARK_MU);
}

void ReleaseMus(void)
{
    Proc_UnblockEachMarked(PROC_MARK_MU);
}
