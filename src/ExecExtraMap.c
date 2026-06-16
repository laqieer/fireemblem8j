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
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

void ExecExtraMap(struct SaveMenuProc * proc)
{
    SetNextGameActionId(8) /* JP: GAME_ACTION enum shifted, EXTRA_MAP=8 */;
    gPlaySt.chapterStateBits |= PLAY_FLAG_EXTRA_MAP;
    ReadExtraMapInfo();
    gPlaySt.chapterIndex = CHAPTER_7F;
    Proc_End(proc->proc_parent);
}
