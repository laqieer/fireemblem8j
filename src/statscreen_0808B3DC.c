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



void CloseHelpBox(void);

void HbMoveCtrl_OnEnd(struct HelpBoxProc* proc)
{
    CloseHelpBox();
    Proc_End((void*) proc);
}

void StartMovingHelpBox(const struct HelpBoxInfo* info, struct Proc* parent)
{
    struct HelpBoxProc* proc = (void*) Proc_StartBlocking(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    proc->info = info;
}

void StartMovingHelpBoxExt(const struct HelpBoxInfo* info, struct Proc* parent, int x, int y)
{
    struct HelpBoxProc* proc = (void*) Proc_StartBlocking(gProcScr_HelpBoxMoveCtrl, parent);

    sHbOrigin.x = x;
    sHbOrigin.y = y;

    proc->info = info;
}

void ApplyHelpBoxContentSize(struct HelpBoxProc* proc, int width, int height)
{
    width = 0xF0 & (width + 15); // align to 16 pixel multiple

    switch (GetHelpBoxItemInfoKind(proc->item))
    {

    case 1: // weapon
        if (width < 0x90)
            width = 0x90;

        if (GetStringTextLen(GetStringFromIndex(proc->mid)) > 8)
            height += 0x20;
        else
            height += 0x10;

        break;
    
    case 2: // staff
        if (width < 0x60)
            width = 0x60;

        height += 0x10;

        break;

    case 3: // save stuff
        width = 0x80;
        height += 0x10;

        break;

    } // switch (GetHelpBoxItemInfoKind(proc->item))

    proc->wBoxFinal = width;
    proc->hBoxFinal = height;
}

void ApplyHelpBoxPosition(struct HelpBoxProc* proc, int x, int y)
{
    int xSpan = proc->wBoxFinal + 0x10;
    int ySpan = proc->hBoxFinal + 0x10;

    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->xBoxFinal = x - 0x10 - xSpan/6;

    if (proc->xBoxFinal < 0)
        proc->xBoxFinal = 0;

    if (proc->xBoxFinal + xSpan > DISPLAY_WIDTH)
        proc->xBoxFinal = DISPLAY_WIDTH - xSpan;

    proc->yBoxFinal = y + 0x10;

    if (proc->yBoxFinal + ySpan > DISPLAY_HEIGHT)
        proc->yBoxFinal = y - ySpan;

    proc->xBoxFinal += 8;
    proc->yBoxFinal += 8;
}

void SetHelpBoxInitPosition(struct HelpBoxProc* proc, int x, int y)
{
    x += sHbOrigin.x*8;
    y += sHbOrigin.y*8;

    proc->xBoxInit = x;
    proc->yBoxInit = y;
}

void ResetHelpBoxInitSize(struct HelpBoxProc* proc)
{
    proc->wBoxInit = 32;
    proc->hBoxInit = 16;
}

int GetHelpBoxItemInfoKind(int item)
{
    if (item == 0xFFFE)
        return HB_EXTINFO_SAVEINFO;

    if (GetItemAttributes(item) & IA_LOCK_3)
        return HB_EXTINFO_NONE;

    if (GetItemAttributes(item) & IA_WEAPON)
        return HB_EXTINFO_WEAPON;

    if (GetItemAttributes(item) & IA_STAFF)
        return HB_EXTINFO_STAFF;

    return HB_EXTINFO_NONE;
}
