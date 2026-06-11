#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





/* prototypes for same-file helpers called by this run */
void EfxDKUpdateFrontAnimPostion(struct ProcEfxDKfx * proc);

void EkrDemoKingBodyShake_Hold(struct ProcEfxDKBody1 * proc)
{
    return;
}

void EkrDemoKingBodyShake_Back(struct ProcEfxDKBody1 * proc)
{
    gEkrXQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -20, 0, proc->timer, 4);
    gEkrYQuakeOff = Interpolate(INTERPOLATE_RCUBIC, -10, 0, proc->timer, 4);

    EkrDragonTmCpyExt(gEkrBgPosition, 0);

    gEkrXPosReal[0] = proc->xPos + gEkrXQuakeOff;
    gEkrYPosReal[0] = proc->yPos + gEkrYQuakeOff;

    EfxDKUpdateFrontAnimPostion(proc->fxproc);

    if (proc->timer > 0x3) {
        proc->timer = 0;
        Proc_Break(proc);
    } else
        proc->timer++;
}

void EkrDragonBodyAnimeSet54(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;

    if (GetEkrDragonStatusType(anim) == EKRDRGON_TYPE_DEMON_KING) {
        proc = Proc_Find(ProcScr_ekrDragonBodyAnime);

#if BUGFIX
        if (!proc)
            return;
#endif

        proc->round_cur = -1;
    }
}
