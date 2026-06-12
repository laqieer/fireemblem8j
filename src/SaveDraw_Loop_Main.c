extern int SaveDraw_DrawExtraMenuOptions();
extern int SaveDraw_DrawMainMenuOptions();
extern int SaveDraw_DrawSlots();
extern int SaveDraw_UpdateSlotPalette();
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

void SaveDraw_ScrollFogBG(struct SaveDrawProc * proc);

//! FE8U = 0x080AB2A0
void SaveDraw_Loop_Main(struct SaveDrawProc * proc)
{
    if (proc->unk_29 != 0)
    {
        if (SAVE_MENU_PARENT(proc)->main_sel_bitfile < 0x100)
        {
            if (SAVE_MENU_PARENT(proc)->main_sel_bitfile == 0x20)
                proc->unk_33 = SAVE_MENU_PARENT(proc)->extra_sel_bitfile;
            else
                proc->unk_33 = SAVE_MENU_PARENT(proc)->main_sel_bitfile;
        }

        SaveDraw_DrawMainMenuOptions(proc);
        SaveDraw_DrawExtraMenuOptions(proc);
        SaveDraw_DrawSlots(proc);
        SaveDraw_UpdateSlotPalette(proc);
    }

    SaveDraw_ScrollFogBG(proc);
    SaveDraw_UpdateParticles(proc->unk_2a);
}
