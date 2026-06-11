
#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"

#include "bmitemuse.h"
#include "constants/songs.h"

extern struct Unit gStatGainSimUnit;

// clang-format off





s8 CanUnitUsePromotionItem(struct Unit* unit, int item)
{
    #define CHECK_LIST(it)                       \
        while (*it)                              \
        {                                        \
            if (unit->pClassData->number == *it) \
                return TRUE;                     \
            it++;                                \
        }                                        \

    const u8* classList = NULL;

    if (unit->pCharacterData->number == CHARACTER_EIRIKA || unit->pCharacterData->number == CHARACTER_EPHRAIM)
    {
        switch (GetItemIndex(item))
        {

        case ITEM_LUNARBRACE:
            classList = gItemUseJidList_LunarBrace;
            break;

        case ITEM_SOLARBRACE:
            classList = gItemUseJidList_SolarBrace;
            break;

        } // switch (GetItemIndex(item))

        if (classList)
            CHECK_LIST(classList);
    }

    if (unit->level < 10)
        return FALSE;

    switch (GetItemIndex(item))
    {

    case ITEM_HEROCREST:
        classList = gItemUseJidList_HeroCrest;
        break;

    case ITEM_KNIGHTCREST:
        classList = gItemUseJidList_KnightCrest;
        break;

    case ITEM_ORIONSBOLT:
        classList = gItemUseJidList_OrionsBolt;
        break;

    case ITEM_ELYSIANWHIP:
        classList = gItemUseJidList_ElysianWhip;
        break;

    case ITEM_GUIDINGRING:
        classList = gItemUseJidList_GuidRing;
        break;

    case ITEM_MASTERSEAL:
        classList = gItemUseJidList_MasterSeal;
        break;

    case ITEM_LUNARBRACE:
        classList = gItemUseJidList_LunarBrace;
        break;

    case ITEM_SOLARBRACE:
        classList = gItemUseJidList_SolarBrace;
        break;

    case ITEM_HEAVENSEAL:
        classList = gItemUseJidList_HeavenSeal;
        break;

    case ITEM_UNK_C1:
        classList = gItemUseJidList_C1;
        break;

    case ITEM_OCEANSEAL:
        classList = gItemUseJidList_OceanSeal;
        break;

    } // switch (GetItemIndex(item))

    CHECK_LIST(classList);

    return FALSE;

    #undef CHECK_LIST
}

s8 CanUnitUseStatGainItem(struct Unit* unit, int item)
{
    s8 result;

    const struct ItemStatBonuses* bonuses = GetItemStatBonuses(item);

    ClearUnit(&gStatGainSimUnit);

    gStatGainSimUnit.pCharacterData = unit->pCharacterData;
    gStatGainSimUnit.pClassData     = unit->pClassData;

    gStatGainSimUnit.maxHP = unit->maxHP + bonuses->hpBonus;
    gStatGainSimUnit.pow = unit->pow + bonuses->powBonus;
    gStatGainSimUnit.skl = unit->skl + bonuses->sklBonus;
    gStatGainSimUnit.spd = unit->spd + bonuses->spdBonus;
    gStatGainSimUnit.def = unit->def + bonuses->defBonus;
    gStatGainSimUnit.res = unit->res + bonuses->resBonus;
    gStatGainSimUnit.lck = unit->lck + bonuses->lckBonus;
    gStatGainSimUnit.movBonus = unit->movBonus + bonuses->movBonus;
    gStatGainSimUnit.conBonus = unit->conBonus + bonuses->conBonus;

    UnitCheckStatCaps(&gStatGainSimUnit);

    result = gStatGainSimUnit.maxHP != unit->maxHP;

    if (gStatGainSimUnit.pow != unit->pow)
        result = TRUE;

    if (gStatGainSimUnit.skl != unit->skl)
        result = TRUE;

    if (gStatGainSimUnit.spd != unit->spd)
        result = TRUE;

    if (gStatGainSimUnit.def != unit->def)
        result = TRUE;

    if (gStatGainSimUnit.res != unit->res)
        result = TRUE;

    if (gStatGainSimUnit.lck != unit->lck)
        result = TRUE;

    if (gStatGainSimUnit.movBonus != unit->movBonus)
        result = TRUE;

    if (gStatGainSimUnit.conBonus != unit->conBonus)
        result = TRUE;

    return result;
}
