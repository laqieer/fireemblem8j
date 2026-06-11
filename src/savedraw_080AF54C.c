#include "global.h"


#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"

#include "savemenu.h"

#define SAVE_MENU_PARENT(proc) ((struct SaveMenuProc *)(proc->proc_parent))

// clang-format off





extern u16 CONST_DATA Sprite_Savedraw_0[];































































/* prototypes for same-file helpers called by this run */
void SaveDraw_ScrollFogBG(struct SaveDrawProc * proc);
struct SaveMenuCursorProc* StartSaveDrawCursor(ProcPtr parent);
void SaveDraw_InitParticles(void);

//! FE8U = 0x080AAA78
void SaveDraw_Init(struct SaveDrawProc * proc)
{
    proc->unk_29 = 1;
    proc->unk_2c = 0;
    proc->unk_2e = 0x100;
    proc->unk_3a = 0;
    proc->unk_3b = 40;
    proc->unk_30 = 0;
    proc->unk_32 = 0;

    SetObjAffine(0, 0x100, 0, 0, 0x100);
    SetObjAffine(1, 0x100, 0, 0, 0x100);
    SetObjAffine(2, 0x100, 0, 0, 0x100);
    SetObjAffine(3, 0x100, 0, 0, 0x100);

    proc->unk_2a = 0;
    proc->unk_34 = StartSaveDrawCursor(proc);
    proc->unk_39 = 0;

    if (SAVE_MENU_PARENT(proc)->sus_slot_cur == 0xff)
    {
        SAVE_MENU_PARENT(proc)->approc = NULL;
    }
    else
    {
        SAVE_MENU_PARENT(proc)->approc =
            APProc_Create(gSaveScreen_0, 320, SAVE_MENU_PARENT(proc)->sus_slot_cur * 32 + 48, 0x3140, 0, 4);
    }

    proc->unk_3c = SAVE_MENU_PARENT(proc)->sus_slot;
    proc->bg_y = 0;
    proc->bg_x = 0;

    StartBgVerticalScroll(EWRAM_ENTRY);
    SetBgVerticalScrollPosition(0, (void *)REG_ADDR_BG2HOFS);
    ClearBgVerticalScrollChannelFlags(0);

    SaveDraw_ScrollFogBG(proc);
    gpBgVerticalScrollSt->scroll_en = true;

    SaveDraw_InitParticles();

    return;
}
