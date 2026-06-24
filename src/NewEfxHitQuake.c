#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

extern const s16 gEfxbattle_0[];
extern const s16 gEfxbattle_1[];
extern const s16 gEfxbattle_5[];
extern const s16 gEfxbattle_6[];

//! FE8U = 0x08053718
void NewEfxHitQuake(struct Anim * anim1, struct Anim * anim2, int kind)
{
    s16 x;
    struct ProcEfxQuake * proc;
    struct Anim * anim;

    if (gEfxHitQuakeExist != 0)
    {
        return;
    }

    gEfxHitQuakeExist = 1;

    proc = Proc_Start(ProcScr_EfxHitQuake, PROC_TREE_3);

    proc->anim_l = anim1;
    proc->anim_r = anim2;
    proc->timer = 0;
    proc->quake_ui = 1;

    if (kind == 0)
    {
        proc->vec = gEfxbattle_0;
    }
    else if (kind == 1)
    {
        proc->vec = gEfxQuakeVecs;
    }
    else if (kind == 2)
    {
        proc->vec = gEfxbattle_1;
    }
    else if (kind == 3)
    {
        proc->vec = gEfxQuakeVecs2;
    }
    else if (kind == 4)
    {
        proc->vec = gEfxbattle_5;
    }
    else if (kind == 5)
    {
        proc->vec = gEfxbattle_6;
    }
    else
    {
        proc->vec = gEfxbattle_0;
    }

    proc->unk_48 = 1;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (GetBattleAnimArenaFlag() != 0)
    {
        proc->unk_64 = NULL;
        return;
    }

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
    {
        proc->unk_64 = NULL;
        return;
    }

    x = gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)];

    if (GetAnimPosition(anim1) == 0)
    {
        proc->unk_36 = 64;
        proc->unk_3e = 104;
        anim = AnimCreate(AnimScr_EkrMainMini_R_Far, 5);
    }
    else
    {
        proc->unk_36 = 176;
        proc->unk_3e = 104;
        anim = AnimCreate(AnimScr_EkrMainMini_L_Far, 5);
    }

    anim->xPosition = proc->unk_36 - x;
    anim->yPosition = proc->unk_3e;

    if (gEkrbattle_5 == 1)
    {
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(1) + OAM2_PAL(3);
    }
    else
    {
        anim->oam2Base = OAM2_CHR(0xC0) + OAM2_LAYER(3) + OAM2_PAL(3);
    }

    proc->unk_64 = anim;

    RegisterDataMove(gEkrbattle_1[GetAnimPosition(anim1)], (void *)0x06011800, 0x800);

    if (gEkrSpellAnimIndex[GetAnimPosition(anim2)] == 0x39)
    {
        CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim2)], gEfxTerrainPalette, PLTT_SIZE_4BPP);
    }

    CpuFastCopy(gBanimTerrainPaletteMaybe[GetAnimPosition(anim1)], gPaletteBuffer + 0x130, PLTT_SIZE_4BPP);
    EnablePaletteSync();

    RegisterBanimTerrainTmByPos(gEkrDistanceType, GetAnimPosition(anim1));
    EfxUpdateBg2Scroll(gEkrBgPosition);

    return;
}
