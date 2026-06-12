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

void MapAnim_DisplayExpBar(ProcPtr proc)
{
    int actorNum = -1;

    switch (gManimSt.actorCount)
    {
    case 2:
        if (gManimSt.actor[1].bu->expGain != 0)
            actorNum = 1;

        // fallthrough

    case 1:
        if (gManimSt.actor[0].bu->expGain != 0)
            actorNum = 0;

        break;
    }

    if (actorNum >= 0)
    {
        struct MAExpBarProc * expProc = Proc_StartBlocking(ProcScr_MapAnimExpBar, proc);

        expProc->expFrom = gManimSt.actor[actorNum].bu->expPrevious;
        expProc->expTo   = gManimSt.actor[actorNum].bu->expPrevious + gManimSt.actor[actorNum].bu->expGain;
        expProc->actorId = actorNum;
    }
}
