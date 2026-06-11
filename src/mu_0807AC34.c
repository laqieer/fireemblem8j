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





void MuStepSe_PlaySeA(struct MuStepSoundProc * proc)
{
    PlaySeSpacial(proc->song1, proc->x1);
}

void MuStepSe_PlaySeB(struct MuStepSoundProc * proc)
{
    if (proc->song2)
        PlaySeSpacial(proc->song2, proc->x2);
}
