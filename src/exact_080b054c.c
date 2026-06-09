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





































































bool SaveMenuHasOptions(struct SaveMenuProc * proc)
{
    if ((proc->main_sel_bitfile & proc->main_options) != 0)
        return true;

    return false;
}
