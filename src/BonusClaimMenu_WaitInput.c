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

//! FE8U = 0x080AA69C
void BonusClaimMenu_WaitInput(struct ProcBonusClaimMenu * proc)
{
    if (proc->unk_4c > 30)
    {
        if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
        {
            CloseHelpBox();
            Proc_Break(proc);
        }

        return;
    }

    proc->unk_4c++;
}
