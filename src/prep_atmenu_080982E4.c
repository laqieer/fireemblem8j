#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

/* prototypes for same-file helpers called by this run */
void AtMenu_DrawSubmenuOptions(struct ProcAtMenu * proc);

void AtMenu_InitSubmenuCursor(struct ProcAtMenu * proc)
{
    ShowPrepScreenMenuFrozenHand();
    AtMenu_DrawSubmenuOptions(proc);
    ShowSysHandCursor(0x1C, proc->hand_pos * 16 + 0x30, 7, 0x400);
}
