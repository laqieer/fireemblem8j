
#include "global.h"

#include <stdlib.h>

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"

#include "statscreen.h"
#include "constants/songs.h"



const struct HelpBoxInfo * EWRAM_DATA sLastHbi = NULL;
































 // tile offsets within an image













struct ProcCmd CONST_DATA gProcScr_HelpBoxLock[] =
{
    PROC_REPEAT(HbLock_OnIdle),
    PROC_END,
};

u16 CONST_DATA sSprite_MetaHelp[] = // 'R is info'
{
    2,
    0x4000, 0x8000, TILEREF(11, 0),
    0x8000, 0x0020, TILEREF(15, 0),
};

struct ProcCmd CONST_DATA gProcScr_HelpPromptSpr[] = // proc displaying 'R is Info'
{
    PROC_SLEEP(0),

    PROC_REPEAT(HelpPrompt_OnIdle),
    PROC_END,
};

/* prototypes for same-file helpers called by this run */
void StartHelpBox(int x, int y, int mid);

void HbLock_OnIdle(struct Proc* proc)
{
    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
        Proc_Break(proc);
}

int StartLockingHelpBox_Unused(int mid, ProcPtr parent)
{
    LoadHelpBoxGfx(NULL, -1);

    StartHelpBox(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), mid);
    Proc_StartBlocking(gProcScr_HelpBoxLock, parent);

    return TRUE;
}

void HelpPrompt_OnIdle(struct HelpPromptSprProc* proc)
{
    PutSprite(0,
        proc->xDisplay, proc->yDisplay,
        sSprite_MetaHelp, proc->tileref);
}

struct Proc* StartHelpPromptSprite_Unused(int x, int y, ProcPtr parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (!proc)
        proc = (void*) Proc_Start(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

struct Proc* StartHelpPromptSprite(int x, int y, int palid, ProcPtr parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    ApplyPalette(Pal_MapBattleInfoNum, palid + 0x10);

    if (!proc)
        proc = (void*) Proc_Start(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0xF & palid);

    return (void*) proc;
}

struct Proc* StartHelpPromptSprite_Unused2(int x, int y, ProcPtr parent)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (!proc)
        proc = (void*) Proc_StartBlocking(gProcScr_HelpPromptSpr, parent);

    proc->xDisplay = x;
    proc->yDisplay = y;
    proc->tileref  = TILEREF(0, 0);

    return (void*) proc;
}

void EndHelpPromptSprite(void)
{
    struct Proc* proc = Proc_Find(gProcScr_HelpPromptSpr);

    if (proc)
        Proc_End(proc);
}

void MoveHelpPromptSprite(int x, int y)
{
    struct HelpPromptSprProc* proc = (void*) Proc_Find(gProcScr_HelpPromptSpr);

    if (proc)
    {
        proc->xDisplay = x;
        proc->yDisplay = y;
    }
}

const struct HelpBoxInfo* GetLastHelpBoxInfo(void)
{
    return sLastHbi;
}
