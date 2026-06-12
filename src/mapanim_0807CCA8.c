#include "global.h"

#include "bmbattle.h"
#include "bmunit.h"
#include "event.h"
#include "fontgrp.h"
#include "mu.h"
#include "proc.h"
#include "uiutils.h"
#include "ap.h"
#include "hardware.h"
#include "bmio.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmap.h"
#include "bm.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "popup.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/event-flags.h"
#include "constants/items.h"
#include "constants/songs.h"

#include "mapanim.h"

extern EWRAM_DATA struct MapAnimState gManimSt;

void MapAnim_DisplayRoundAnim(ProcPtr proc)
{
    Proc_StartBlocking(MapAnim_GetRoundProcScript(), proc);
}
