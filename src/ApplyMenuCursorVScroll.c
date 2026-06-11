#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"

void ApplyMenuCursorVScroll(struct MenuProc* proc, int* xRef, int* yRef)
{
    int off;

    if (proc->itemCount <= 9)
        return;

    off = (proc->itemCount*16 - 9*16) * proc->itemCurrent / 9;

    BG_SetPosition(proc->frontBg, 0, off);
    BG_SetPosition(proc->backBg, 0, off);

    *yRef -= off;
}
