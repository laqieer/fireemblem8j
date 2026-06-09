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





































































//! FE8U = 0x080AB874
void AddMainMenuOption(struct SaveMenuProc * proc, int option) {
    proc->main_options |= option;
    proc->unk_31++;
    return;
}

//! FE8U = 0x080AB888
void AddExtraMenuOption(struct SaveMenuProc * proc, int option) {
    proc->extra_options |= option;
    proc->max_choice++;
    return;
}
