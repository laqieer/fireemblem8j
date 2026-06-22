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

void SetBattleMuPaletteByIndex(int actorNum)
{
    if (UNIT_FACTION(gManimSt.actor[0].unit) == UNIT_FACTION(gManimSt.actor[1].unit))
        if (!BUNIT_IS_OBSTACLE(gManimSt.actor[0].bu) && !BUNIT_IS_OBSTACLE(gManimSt.actor[1].bu))
            return;

    // Check actor class
    if (UNIT_CLASS_ID(gManimSt.actor[actorNum].unit) != CLASS_MANAKETE_MYRRH)
        return;

    // Check actor weapon
    if (GetItemIndex(gManimSt.actor[actorNum].bu->weaponBefore) != ITEM_DIVINESTONE)
        return;

    SetMuPal(gManimSt.actor[actorNum].mu, BM_OBJPAL_BANIM_SPECIALMU + actorNum);
    SetMuSpecialSprite(gManimSt.actor[actorNum].mu, CLASS_MANAKETE, Pal_MapAnimManaketeMu);
}
