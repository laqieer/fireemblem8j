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



void ApplyHelpBoxPosition(struct HelpBoxProc* proc, int x, int y);
void SetHelpBoxInitPosition(struct HelpBoxProc* proc, int x, int y);

void StartHelpBoxExt(const struct HelpBoxInfo* info, int unk)
{
    struct HelpBoxProc* proc;
    int wContent, hContent;

    proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (!proc)
    {
        proc = (void*) Proc_Start(gProcScr_HelpBox, PROC_TREE_3);

        proc->unk52 = unk;

        SetHelpBoxInitPosition(proc, info->xDisplay, info->yDisplay);
        ResetHelpBoxInitSize(proc);
    }
    else
    {
        proc->xBoxInit = proc->xBox;
        proc->yBoxInit = proc->yBox;

        proc->wBoxInit = proc->wBox;
        proc->hBoxInit = proc->hBox;
    }

    proc->info = info;

    proc->timer    = 0;
    proc->timerMax = 12;

    proc->item = 0;
    proc->mid = info->mid;

    if (proc->info->populate)
        proc->info->populate(proc);

    SetTextFontGlyphs(1);
    GetStringTextBox(GetStringFromIndex(proc->mid), &wContent, &hContent);
    SetTextFontGlyphs(0);

    ApplyHelpBoxContentSize(proc, wContent, hContent);
    ApplyHelpBoxPosition(proc, info->xDisplay, info->yDisplay);

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->mid);

    sLastHbi = info;
}

void StartHelpBoxExt_Unk(int x, int y, int mid)
{
    struct HelpBoxProc* proc;
    int wContent, hContent;

    proc = (void*) Proc_Start(gProcScr_HelpBox, PROC_TREE_3);

    proc->unk52 = TRUE;

    if (x < 0 && y < 0)
    {
        x = GetUiHandPrevDisplayX();
        y = GetUiHandPrevDisplayY();
    }

    proc->timer    = 0;
    proc->timerMax = 12;

    proc->item = 0;
    proc->mid = mid;

    SetTextFontGlyphs(1);
    GetStringTextBox(GetStringFromIndex(proc->mid), &wContent, &hContent);
    SetTextFontGlyphs(0);

    ResetHelpBoxInitSize(proc);
    ApplyHelpBoxContentSize(proc, wContent, hContent);

    proc->xBoxInit = x + 8;
    proc->yBoxInit = y + 8;

    proc->xBoxFinal = x + 8;
    proc->yBoxFinal = y + 8;

    ClearHelpBoxText();
    StartHelpBoxTextInit(proc->item, proc->mid);
}

void CloseHelpBox(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        ClearHelpBoxText();
        Proc_Goto(proc, 0x63);
    }
}

void EndHelpBox(void)
{
    struct HelpBoxProc* proc = (void*) Proc_Find(gProcScr_HelpBox);

    if (proc)
    {
        ClearHelpBoxText();
        Proc_End(proc);
    }
}
