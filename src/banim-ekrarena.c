#include "global.h"

#include "hardware.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "bm.h"

#include "ekrbattle.h"
#include "constants/songs.h"



//! FE8U = 0x0805B034
void EkrArenaBgScroll(int x)
{
    int x1 = x >> 3;
    int x2 = x & 7;

    BG_SetPosition(BG_3, x2, 0);
    EfxTmCpyExt(gTmB_Banim + 8 + x1, 66, gBG3TilemapBuffer, 32, 32, 22, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x0805B07C
void PlayDeathSoundForArena(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        EfxPlaySE(SONG_8F, 0x100);
    }

    return;
}

//! FE8U = 0x0805B094
void StopArenaBattleMusic(void)
{
    if (GetBattleAnimArenaFlag() != 0)
    {
        DoM4aSongNumStop(SONG_8E);
    }

    return;
}

//! FE8U = 0x0805B0A8
void BeginAnimsOnBattle_Arena(void)
{
    u32 pos;

    NewEkrBattleDeamon();
    AnimClearAll();

    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;

    NewEkrTogiInitPROC();
    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x0805B0CC
void ExecBattleAnimArenaExit(void)
{
    AnimClearAll();
    NewEkrTogiEndPROC();

    SetMainUpdateRoutine(MainUpdate_0);
    Proc_EndEach(ProcScr_efxStatusUnit);

    return;
}

// clang-format on

//! FE8U = 0x0805B0F0
void NewEkrTogiInitPROC(void)
{
    Proc_Start(gProc_ekrTogiInit, PROC_TREE_3);
    return;
}

//! FE8U = 0x0805B104
void ekrTogiInit_Init(ProcPtr proc)
{
    InitOam(0);

    gEkrInitPosReal = gEkrInitialHitSide;

    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    CpuFastCopy(Pal_ArenaBattleBg_A, gPaletteBuffer + 0x60, 0x80);
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);
    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);
    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, 0x10);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B18C
void ekrTogiInit_LoadGfx(struct ProcEkrTogi * proc)
{
    LZ77UnCompVram(Img_ArenaBattleBg, (void *)0x06008000);
    LZ77UnCompWram(Tsa_ArenaBattleBg, gEkrTsaBuffer);
    EfxTmCpyExt(gEkrTsaBuffer, -1, gTmB_Banim, 66, 46, 20, 6, 0);
    EkrArenaBgScroll(0);

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    EfxPlaySE(SONG_8E, 0x100);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B200
void ekrTogiInit_Loop(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);

    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, ret);
    EnablePaletteSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805B264
void ekrTogiInit_End(ProcPtr proc)
{
    NewEkrTogiColor();
    Proc_Break(proc);
    return;
}

// clang-format on

//! FE8U = 0x0805B278
void NewEkrTogiEndPROC(void)
{
    Proc_Start(gProc_ekrTogiEnd, PROC_TREE_3);
    EndEkrTogiColor();
    return;
}

//! FE8U = 0x0805B290
void ekrTogiEnd_Init(struct ProcEkrTogi * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    proc->unk_2c = 0;
    proc->unk_2e = 16;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805B2BC
void ekrTogiEnd_Loop(struct ProcEkrTogi * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->unk_2c, proc->unk_2e);

    CpuFastCopy(gEfxPal, gPaletteBuffer, 0x400);
    EfxPalBlackInOut(gPaletteBuffer, 0, 0x20, ret);

    EnablePaletteSync();

    if (++proc->unk_2c == proc->unk_2e + 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805B320
void ekrTogiEnd_End(ProcPtr proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();

    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    Proc_Break(proc);

    return;
}
