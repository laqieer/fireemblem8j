#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





void EkrDKHandler_NewDragonAnime(struct ProcEkrDragon * proc)
{
    proc->fxproc = NewEkrDragonBodyAnime(proc->anim);
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

ProcPtr NewEkrDragonBodyAnime(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBodyAnime, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0;
    proc->frame = 0;
    proc->frame_lut = NULL;
    proc->tsa_set = TsaSet_DKBody;
    proc->round_cur = -1;

    return proc;
}
