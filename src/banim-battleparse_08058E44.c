#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "spellassoc.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"
#include "constants/items.h"

s16 GetSpellAnimId(u16 jid, u16 weapon)
{
    int ret;
    s16 efx;
    u16 item = GetItemIndex(weapon);
    const struct SpellAssoc * it;
    for (it = gSpellAssocData; it->item != 0xFFFF; it++)
    {
        if (it->item == item)
            break;
    }
    efx = it->efx;
    ret = efx;
    if (it->efx == 3)
    {
        switch (jid) {
        case CLASS_CAVALIER:
        case CLASS_CAVALIER_F:
            ret = 4; break;
        case CLASS_SOLDIER:
            ret = 5; break;
        case CLASS_PALADIN:
            ret = 0x6; break;
        case CLASS_PALADIN_F:
            ret = 0xD; break;
        case CLASS_PEGASUS_KNIGHT:
            ret = 0x7; break;
        case CLASS_FALCON_KNIGHT:
            ret = 0x8; break;
        case CLASS_WYVERN_RIDER:
        case CLASS_WYVERN_RIDER_F:
            ret = 0x9; break;
        case CLASS_WYVERN_LORD:
        case CLASS_WYVERN_LORD_F:
            ret = 0xA; break;
        case CLASS_GENERAL:
        case CLASS_GENERAL_F:
            ret = 0xB; break;
        default: break;
        }
    }
    return ret;
}
