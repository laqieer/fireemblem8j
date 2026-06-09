#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





/* prototypes for same-file helpers called by this run */
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc);

void EkrDemoKingBodyShake_Init(struct ProcEfxDKBody1 * proc)
{
    proc->timer = 0;
    proc->xPos = gEkrXPosReal[0];
    proc->yPos = gEkrYPosReal[0];
}

void EkrDemoKingBodyShake_OnEnd(struct ProcEfxDKBody1 * proc)
{
    gEkrXPosReal[0] = proc->xPos;
    gEkrYPosReal[0] = proc->yPos;
    EfxDKUpdateFrontAnimPostion(proc->fxproc);
}
