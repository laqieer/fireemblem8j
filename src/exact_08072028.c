#include "gbafe.h"





u32 GetEkrDragonStatusType_(struct Anim * anim);

/* prototypes for same-file helpers called by this run */
struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim);

/* 1 for Draco Zombie, 2 for DemonKing, 3 for Myrrh */
u32 GetEkrDragonStatusType_(struct Anim * anim)
{
    return GetEkrDragonStatus(anim)->type;
}

void SetEkrDragonStatusType(struct Anim * anim, u8 type)
{
    GetEkrDragonStatus(anim)->type = type;
}
