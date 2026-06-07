#include "gbafe.h"





u32 GetEkrDragonStatusType_(struct Anim * anim);

/* prototypes for same-file helpers called by this run */
u16 GetEkrDragonStatusAttr(struct Anim * anim);

bool CheckEfrDragonStatusAttrPrepared(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_BANIMFX_PREPARED)
        return true;
    else
        return false;
}

bool CheckEfrDragonStatusAttrEnd(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);

    if (attr & EKRDRGON_ATTR_END)
        return true;
    else
        return false;
}
