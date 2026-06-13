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

//! FE8U = 0x080AA9D8
void SaveDraw_ScrollFogBG(struct SaveDrawProc * proc)
{
    u16 * ptr;
    int i;
    int x;
    u32 bg_y;
    u32 angle;

    proc->bg_x++;
    proc->bg_y += 2;

    x = (proc->bg_x & 0xfff) >> 3;
    bg_y = (proc->bg_y / 8) & 0xff;

    ptr = GetBgVerticalScrollBuffer(0, true);
    angle = bg_y;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        int v = SIN(angle) / 0x300;
        ptr[i] = (v + x) & 0x1ff;
        angle += 12;
    }

    BG_SetPosition(BG_2, x, bg_y);

    FlipBgVerticalScroll();
}
