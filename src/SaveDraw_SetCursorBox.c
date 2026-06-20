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

//! FE8U = 0x080AB4F4
void SaveDraw_SetCursorBox(int a, s16 b, s16 c, struct SaveDrawProc * proc)
{
    int bb = b;
    int cc = c;
    struct SaveDrawCursorProc* drawCursorProc = proc->unk_34;

    drawCursorProc->unk_32 = cc - 12;
    drawCursorProc->unk_2e = bb - 2;
    drawCursorProc->cursor_en = 1;
    drawCursorProc->unk_3a = a;
    return;
}
