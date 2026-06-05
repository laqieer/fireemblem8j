#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

EWRAM_DATA ProcPtr gpActiveClassReelSpellProc = NULL;
EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc = NULL;

//! FE8U = 0x0806E8F0
void ResetClassReelSpell(void)
{
    gpActiveClassReelSpellProc = NULL;
    gpActiveCRSpellBgColorProc = NULL;

    return;
}

//! FE8U = 0x0806E904
void EndActiveClassReelSpell(void)
{
    if (gpActiveClassReelSpellProc != NULL)
    {
        Proc_End(gpActiveClassReelSpellProc);
        gpActiveClassReelSpellProc = NULL;
    }

    return;
}

//! FE8U = 0x0806E920
void EndActiveClassReelBgColorProc(void)
{
    if (gpActiveCRSpellBgColorProc != NULL)
    {
        Proc_End(gpActiveCRSpellBgColorProc);
        gpActiveCRSpellBgColorProc = NULL;
    }

    return;
}

//! FE8U = 0x0806E93C
void SetActiveClassReelSpell(ProcPtr proc)
{
    gpActiveClassReelSpellProc = proc;
    return;
}

//! FE8U = 0x0806E948
void SetActiveCRSpellBgColorProc(ProcPtr proc)
{
    gpActiveCRSpellBgColorProc = proc;
    return;
}
