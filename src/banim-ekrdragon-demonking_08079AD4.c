#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





/* prototypes for same-file helpers called by this run */
ProcPtr NewProc087F4518(struct Anim * anim);
ProcPtr NewEkrDragonTunkFace(struct Anim * anim);
void NewEkrWhiteOUT(int a, int b, int c);

void EkrDragonTunkFaceHoldPos(struct ProcEfxDKfx * proc)
{
    struct Anim * anim = proc->anim2;

    anim->xPosition = proc->unk32;
    anim->yPosition = proc->unk3A;

    if (++proc->timer == 0x12C) {
        Proc_Break(proc);
    }
}

void EfxTmDecompress(int xtile, int ytile, const u16 *tsa)
{
    int x = xtile >> 3;
    int y = ytile >> 3;

    EfxTmFill(0);
    LZ77UnCompWram(tsa, gEkrTsaBuffer);

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, x, y),
        EFX_BG_WIDTH, TILE_SIZE_4BPP,
        TILE_SIZE_4BPP, 6, 0);
}

void EfxBG3TmSetPosition(int xtile, int ytile)
{
    int x = xtile >> 3;
    int xbg = xtile & 7;
    int y = ytile >> 3;
    int ybg = ytile & 7;

    BG_SetPosition(BG_3, xbg, ybg);
    EfxTmCpyExt(
        EFX_TILEMAP_LOC(gTmB_Banim, x, y),
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, TILE_SIZE_4BPP, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}

ProcPtr NewEkrDragonTunk(struct Anim * anim)
{
    struct ProcEkrDragonTunk * proc;
    proc = Proc_Start(ProcScr_ekrDragonTunk, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer1 = 0;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        proc->unk32 = -8;
    else
        proc->unk32 = -32;
    
    Sound_FadeOutBGM(1);
    return proc;
}

void DemonKingDeadWhiteOut(struct ProcEkrDragonTunk * proc)
{
    if (++proc->timer1 == 0x1) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x23) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x32) {
        NewEkrWhiteOUT(3, 2, 3);
        PlaySFX(0x147, 0x100, 0x78, 0x0);
    }

    if (proc->timer1 == 0x36) {
        SetAnimStateHidden(GetAnimPosition(proc->anim));
        EfxTmDecompress(proc->unk32, -8, Tsa_DemonKingBG1);
        EfxBG3TmSetPosition(0, 0);
    }

    if (proc->timer1 == 0x64) {
        proc->timer1 = 0;
        proc->timer2 = 0;
        Proc_Break(proc);
        NewProc087F4518(proc->anim);
    }
}

void EkrDragonTunkMain(struct ProcEkrDragonTunk * proc)
{
    int _0 = 0;

    if (proc->timer2 <=0x18A)
        EfxBG3TmSetPosition(gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    
    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrDemonkingObj_SetBgPosition(gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    
    if (++proc->timer2 == 0x2) {
        proc->qproc = NewEfxQuakePure(0xC, 0);
        PlaySFX(0x142, 0x100, 0x78, 0x0);
    }

    if (proc->timer2 == 0x78) {
        Proc_End(proc->qproc);
        proc->qproc = NewEfxQuakePure(0xD, 0);
    }

    if (proc->timer2 == 0xB4) {
        Proc_End(proc->qproc);
        proc->qproc = NewEfxQuakePure(0xE, 0);
    }

    if (proc->timer2 == 0xE6) {
        proc->unk3A = _0;
        proc->unk3C = _0;
        proc->fproc = NewEkrDragonTunkFace(proc->anim);
        proc->fproc->xPos = proc->anim->xPosition;
        proc->fproc->yPos = proc->anim->yPosition - proc->unk3A;
    }

    if (proc->timer2 == 0xE7) {
        EfxTmDecompress(proc->unk32, -8, Tsa_DemonKingBG2);
        EfxBG3TmSetPosition(0, 0);
    }

    if (proc->timer2 > 0xE5) {
        proc->fproc->xPos = proc->anim->xPosition;
        proc->fproc->yPos = proc->anim->yPosition;

        proc->fproc->xPos -= gEkrBg2QuakeVec.x;
        proc->fproc->yPos -= gEkrBg2QuakeVec.y;
    }

    if (proc->timer2 == 0xF0)
        NewEkrWhiteOUT(0x7D, 0x1E, 0x78);
    
    if (proc->timer2 == 0x18B) {
        Proc_End(proc->fproc);
        Proc_End(proc->qproc);
        gEkrBg2QuakeVec.x = _0;
        gEkrBg2QuakeVec.y = _0;

        BG_Fill(gBG3TilemapBuffer, 0x601F);
        BG_EnableSyncByMask(BG3_SYNC_BIT);

        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrDemonkingObj_SetBgPosition(0, 0);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
    }

    if (proc->timer2 == 0x203) {
        proc->finished = true;
        Proc_Break(proc);
    }
}
