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

extern u16 gEndingTmScratchA[];



// TODO: Implicit declaration
int LoadBonusContentData(void *);

//! FE8U = 0x080A99C0
void SaveMenuScrollSlot(struct SaveMenuProc * proc)
{
    int unk;

    proc->jump_label = PL_SAVEMENU_SCROLL_SLOT;
    proc->scroll_cnt++;

    unk = 0xe - proc->scroll_cnt;
    proc->unk_2f = -0x24 - (unk * 0xdc * unk / 0xc4);

    if (proc->scroll_cnt == 0xe)
        Proc_Break(proc);
}
