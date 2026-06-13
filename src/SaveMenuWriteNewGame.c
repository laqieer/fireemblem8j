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

//! FE8U = 0x080A9250
void SaveMenuWriteNewGame(struct SaveMenuProc * proc)
{
    int isDifficult;
    int isTutorial;

    switch (proc->difficulty) {
    case 0:
        isTutorial = 0;
        isDifficult = 0;
        break;
    case 1:
        isTutorial = 1;
        isDifficult = 0;
        break;
    case 2:
        isTutorial = 1;
        isDifficult = 1;
        break;
    }

    WriteNewGameSave(proc->sus_slot, isDifficult, 1, isTutorial);
}
