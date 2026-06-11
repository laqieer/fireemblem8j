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

//! FE8U = 0x080AA100
void ExtraMapStartSomeBgm(struct SaveMenuProc * proc)
{
    ChangeBgm(SONG_NONE, 0xc0, 0, 0x18, proc);
}
