#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





void EkrdragonDemonking_Init(struct ProcEfxDKfx * proc)
{
    proc->finished = false;
    proc->timer = 0;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        proc->unk32 = -32;
    else
        proc->unk32 = 0;
}
