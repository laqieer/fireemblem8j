#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_SaveMenu[];

//! FE8U = 0x080AA4C0
void StartSaveMenu(ProcPtr parent)
{
    struct SaveMenuProc * proc = Proc_StartBlocking(ProcScr_SaveMenu, parent);
    proc->main_sel_bitfile = 0x100;
    proc->extra_sel_bitfile = 0;

    gPlaySt.config.textSpeed = 2;
}
