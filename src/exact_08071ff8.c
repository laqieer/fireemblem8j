#include "gbafe.h"





u32 GetEkrDragonStatusType_(struct Anim * anim);

/* prototypes for same-file helpers called by this run */
struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim);

u16 GetEkrDragonStatusAttr(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->attr;
}

void AddEkrDragonStatusAttr(struct Anim * anim, u16 attr_bitfile)
{
    GetEkrDragonStatus(anim)->attr |= attr_bitfile;
}
