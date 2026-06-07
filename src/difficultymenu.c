#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"







/* prototypes for same-file helpers called by this run */
void InitDifficultySelectScreen(struct DifficultyMenuProc * proc);

//! FE8U = 0x080AC1A8
void DifficultySelect_Init(struct DifficultyMenuProc * proc)
{
    proc->current_selection = 0;
    proc->unk_2c = 0;
    InitDifficultySelectScreen(proc);
    return;
}

//! FE8U = 0x080AC1BC
void DifficultySelect_WinBoxOpen(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    SetDispEnable(1, 1, 1, 1, 1);

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, 0x50 - c, 0xf0, c + 0x50);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080AC22C
void DifficultySelect_WinBoxClose(struct DifficultyMenuProc * proc)
{
    int a;
    int b;
    int c;

    proc->unk_2c++;

    a = (0x10 - proc->unk_2c);
    b = (a * 0x50 * a) / 256;
    c = 0x50 - b;

    SetWin0Box(0, c, 0xf0, -0x60 - c);

    if (proc->unk_2c == 0x10)
    {
        Proc_Break(proc);
    }

    return;
}
