#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





/* prototypes for same-file helpers called by this run */
int CheckEkrWpnDemonLight(struct Anim * anim);

void NewEkrDemoKingAtk(struct Anim * anim, int round_type)
{
    struct ProcEfxDKBody4 * proc;
    proc = Proc_Start(ProcScr_EkrDemoKingAtk, PROC_TREE_3);
    proc->round_type = round_type;
    proc->anim = anim;
}

void EkrDemoKingAtkMain(struct ProcEfxDKBody4 * proc)
{
    struct ProcEfxDKfx *fxproc;
    struct ProcEfxDKBody1 *bdproc;

    if (proc->anim->state3 & ANIM_BIT3_BLOCKING)
        if (!(proc->anim->state3 & ANIM_BIT3_BLOCKEND))
            return;

    Proc_Break(proc);

    fxproc = Proc_Find(ProcScr_ekrDragonBodyAnime);
    fxproc->timer = 0;
    fxproc->unk2E = 0;
    fxproc->frame = 0;

    switch (proc->round_type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        if (CheckEkrWpnDemonLight(proc->anim) != false)
            fxproc->frame_lut = BnaimFrames_DkDemonLightNormal;
        else {
            fxproc->frame_lut = BnaimFrames_DkRavagerNormal;
            bdproc = Proc_Start(ProcScr_EkrDemoKingAtkRavagerNormal, PROC_TREE_3);
            bdproc->fxproc = fxproc;
        }
        break;

    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_CRIT_FAR:
        if (CheckEkrWpnDemonLight(proc->anim) != false) {
            fxproc->frame_lut = BnaimFrames_DkDemonLightCritical;
            NewEkrSelfThunder(proc->anim);
        } else {
            fxproc->frame_lut = BnaimFrames_DkRavagerCritical;
            bdproc = Proc_Start(ProcScr_EkrDemoKingAtkRavagerCritical, PROC_TREE_3);
            bdproc->fxproc = fxproc;
            NewEkrSelfThunder(proc->anim);
        }
    }
}

ProcPtr NewEkrDragonBodvBlack(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_ekrDragonBodvBlack, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->finished = 0;
    return proc;
}

void EkrDragonBodyBlack_FadePalStep(int val)
{
    CpuFastCopy(Pal_ConstDataBanimekrdk_0, PAL_BG(4), 0x20);
    EfxPalBlackInOut(gPaletteBuffer, 4, 1, val);
}

void EkrDragonBodyBlackMain(struct ProcEfxDKfx * proc)
{
    int ret = Interpolate(INTERPOLATE_RSQUARE, 0, 0x10, proc->timer, 0x8);
    CpuFastCopy(Pal_DemonKingBG, PAL_BG(0x6), 0x20);
    CpuFastCopy(gpEfxUnitPaletteBackup[0], PAL_OBJ(0x7), 0x20);
    EfxPalBlackInOut(gPaletteBuffer, 6, 1, ret);
    EfxPalBlackInOut(gPaletteBuffer, 0x17, 1, ret);
    EnablePaletteSync();

    if (++proc->timer == 9) {
        proc->finished = true;
        Proc_Break(proc);
    }
}
