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





































































//! FE8U = 0x080AB514
void SaveDraw_SetCursorSlotMark(int a, u8 b, struct SaveDrawProc * proc)
{
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_37 = b;
    drawCursorProc->unk_38 = 1;
    drawCursorProc->unk_3a = a;
    drawCursorProc->unk_39 = 0;
    return;
}
