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
void SetMuMoveScript(struct MuProc * mu, const u8 commands[MOVE_CMD_MAX_COUNT]);

void SetMuFacing(struct MuProc * proc, int facing)
{
    proc->facing = facing;

    if (facing == MU_FACING_STANDING)
        SetStandingMuFacing(proc->slot, proc->pGfxVRAM);
    else
        AP_SwitchAnimation(proc->sprite_anim, proc->facing);
}

void SetMuDefaultFacing(struct MuProc * proc)
{
    if (GetClassData(proc->jid)->attributes & CA_MOUNTEDAID)
        SetMuFacing(proc, 1);
    else
        SetMuFacing(proc, 2);
}

void SetAutoMuDefaultFacing(void)
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (proc)
        SetMuDefaultFacing(proc);
}

void SetAutoMuMoveScript(const u8 commands[MOVE_CMD_MAX_COUNT])
{
    struct MuProc * proc = Proc_Find(ProcScr_Mu);
    if (proc)
        SetMuMoveScript(proc, commands);
}

bool MuExists(void)
{
    return Proc_Find(ProcScr_Mu) ? true : false;
}
