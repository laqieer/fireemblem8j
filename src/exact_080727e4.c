#include "gbafe.h"

bool CheckEkrDragonSkipTransfer(struct Anim * anim)
{
    u16 attr = GetEkrDragonStatusAttr(anim);
    if (attr & EKRDRGON_ATTR_SKIP)
        return true;
    else
        return false;
}
