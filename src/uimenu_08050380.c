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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProc_Menu[];

void FreezeMenu(void)
{
    struct MenuProc* proc = Proc_Find(sProc_Menu);

    if (proc)
        proc->state |= MENU_STATE_FROZEN;
}
