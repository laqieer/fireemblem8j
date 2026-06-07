#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





void EkrDemoKing_DecompressBgTsaHFlip(int arg1, int arg2)
{
    int _a1 = arg1 >> 3;
    int _a2 = arg2 >> 3;

    Decompress(Tsa_DemonKingBG1, gEkrTsaBuffer);

    EfxTmCpyExtHFlip(&gEkrTsaBuffer[0x3C0], -1,
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2),
        EFX_BG_WIDTH, TILE_SIZE_4BPP, 2, 6, 0);

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2 + 2),
        EFX_BG_WIDTH, TILE_SIZE_4BPP,
        30, 6, 0);
}

void EkrDemoKing_BG3TmSetPosition(int arg1, int arg2)
{
    int _a1 = arg1 >> 3;
    int a = arg1 & 7;
    int _a2 = arg2 >> 3;
    int b = arg2 & 7;

    BG_SetPosition(BG_3, a, b);
    EfxTmCpyExt(
        EFX_TILEMAP_LOC(gTmB_Banim, _a1, _a2),
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, TILE_SIZE_4BPP, -1, -1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

ProcPtr NewProc087F4518(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_EkrdragonDemonking_0, PROC_TREE_3);
    proc->anim = anim;
    Sound_FadeOutBGM(1);
    return proc;
}

ProcPtr NewEkrDragonTunkFace(struct Anim * anim)
{
    struct ProcEfxDKfx * proc;
    proc = Proc_Start(ProcScr_ekrDragonTunkFace, PROC_TREE_3);
    proc->anim = anim;
    return proc;
}

void EkrDragonTunkFaceRegisterAnim(struct ProcEfxDKfx * proc)
{
    struct Anim * anim;

    const u32 *scr = BanimScr_DemoKingTunkFace;
    SpellFx_RegisterObjPal(Pal_DemoKingTunkFace, 0x20);
    SpellFx_RegisterObjGfx(Img_DemoKingTunkFace, 0x2000);
    anim = EfxCreateBackAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
    proc->timer = 0;
}

void EkrDragonTunkFaceIdle(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer > 3) {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
        EkrDragonTunkFaceRegisterAnim2(proc);
    }
}

void EkrDragonTunkFaceRegisterAnim2(struct ProcEfxDKfx * proc)
{
    struct Anim * anim;

    const u32 *scr = BanimScr_Ekrdragonfx_3;
    SpellFx_RegisterObjPal(Pal_DemoKingTunkFace, 0x20);
    SpellFx_RegisterObjGfx(Img_DemoKingTunkFace2, 0x2000);
    anim = EfxCreateBackAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = anim;
    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
    proc->timer = 0;
}

void EkrDragonTunkFaceIdle2(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;
}

void EkrDragonTunkFace_OnEnd(struct ProcEfxDKfx * proc)
{
    AnimDelete(proc->anim2);
}
