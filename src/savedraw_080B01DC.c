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

extern EWRAM_OVERLAY(0) struct Unknown020007E0 gSavedraw_0[0x14];
extern EWRAM_OVERLAY(0) struct Font gSaveMenuSubBoxFont;
extern EWRAM_OVERLAY(0) struct Text gSaveMenuSubBoxText;

extern u16 CONST_DATA Sprite_Savedraw_0[];







extern u16 CONST_DATA Sprite_Savedraw_4[];

extern u16 CONST_DATA Sprite_Savedraw_5[];



extern u16 CONST_DATA Sprite_Savedraw_7[];













































extern u16 * CONST_DATA SpriteArray_Savedraw_0[];

extern u16 * CONST_DATA SpriteArray_Savedraw_1[];

/* prototypes for same-file helpers called by this run */
void SaveDraw_ScrollFogBG(struct SaveDrawProc * proc);

//! FE8U = 0x080AB720
void SaveBgFog_Init(struct SaveDrawProc * proc)
{
    proc->bg_y = 0;
    proc->bg_x = 0;

    SetBgVerticalScrollPosition(0, (void *)REG_ADDR_BG2HOFS);
    ClearBgVerticalScrollChannelFlags(0);
    SaveDraw_ScrollFogBG(proc);

    gpBgVerticalScrollSt->scroll_en = true;

    return;
}
