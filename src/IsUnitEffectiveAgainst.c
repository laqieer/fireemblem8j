#include "global.h"
#include "constants/items.h"
#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "bmitem.h"

s8 IsUnitEffectiveAgainst(struct Unit* actor, struct Unit* target) {
    int actorClass = actor->pClassData->number;
    int targetClass = target->pClassData->number;

    const u8* effList = NULL;

    switch (actorClass) {

    case 0x2B:
    case 0x2C:
        effList = ItemEffectiveness_Monsters;
        break;

    } // switch (actorClass)

    if (!effList)
        return FALSE;

    for (; *effList; ++effList)
        if (*effList == targetClass)
            // NOTE: see note in IsItemEffectiveAgainst
            goto is_effective;

    return FALSE;

    is_effective:
        return TRUE;
}
