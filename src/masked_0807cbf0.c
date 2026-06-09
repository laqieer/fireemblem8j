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

EWRAM_DATA struct MapAnimState gManimSt = { 0 };

void MapAnim_AdvanceBattleRound(void)
{
    gManimSt.subjectActorId = !!(gManimSt.pCurrentRound->info & BATTLE_HIT_INFO_RETALIATION);
    gManimSt.targetActorId = 1 - gManimSt.subjectActorId;

    gManimSt.hitAttributes = gManimSt.pCurrentRound->attributes;
    gManimSt.hitInfo = gManimSt.pCurrentRound->info;
    gManimSt.hitDamage = gManimSt.pCurrentRound->hpChange;

    if (gManimSt.actorCount == 1)
    {
        gManimSt.subjectActorId = 0;
        gManimSt.targetActorId = 0;
    }

    gManimSt.pCurrentRound++;
}
