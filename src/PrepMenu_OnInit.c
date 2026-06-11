#include "global.h"
#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

void PrepMenu_OnInit(struct ProcPrepMenu * proc)
{
    int i;
    for (i = 0; i < 8; i++)
        proc->cmds[i] = 0;

    proc->cur_index = 0;
    proc->max_index = 0;

    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0x600, 1);

    proc->on_PressB = NULL;
    proc->on_PressStart = NULL;
    proc->on_End = NULL;
    proc->do_help = false;
}
