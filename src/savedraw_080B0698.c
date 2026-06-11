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































































//! FE8U = 0x080ABBE4
void SaveBgUp_Loop(void)
{
    RegisterDataMove(gBG2TilemapBuffer, (void*)0x06007000, 0x800);
    return;
}
