#include "gbafe.h"

extern EWRAM_OVERLAY(banim) struct EkrDragonStatus gEkrDragonStatusLeft;
extern EWRAM_OVERLAY(banim) struct EkrDragonStatus gEkrDragonStatusRight;
extern EWRAM_OVERLAY(banim) u16 gEkrDragonPalBackup[0x40 / sizeof(u16)];

u32 GetEkrDragonStatusType_(struct Anim * anim);

struct EkrDragonStatus * GetEkrDragonStatus(struct Anim * anim)
{
    if (GetAnimPosition(anim) == EKR_POS_L)
        return &gEkrDragonStatusLeft;
    else
        return &gEkrDragonStatusRight;
}
