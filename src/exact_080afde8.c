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





































































//! FE8U = 0x080AB314
void SaveDrawCursor_Init(struct SaveDrawCursorProc * proc)
{
    proc->cursor_en = 0;

    proc->unk_2a = 0;
    proc->unk_2e = 0;
    proc->main_options = 0;
    proc->unk_32 = 0;
    proc->unk_34 = 0;

    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_3a = 0;
    proc->sus_slot = 0;
    return;
}
