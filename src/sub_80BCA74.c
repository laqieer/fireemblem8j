#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "proc.h"
#include "variables.h"

struct GameRankProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2c;
    /* 30 */ int unk30;
    /* 34 */ u8 _pad34[0x3a - 0x34];
    /* 3A */ u8 ranks[6];
    /* 40 */ u8 unk40[6];
    /* 46 */ u8 unk46[6];
    /* 4C */ u16 unk4c[6];
};

struct RankRamUnk
{
    /* 00 */ u32 unk00;
    /* 04 */ u32 unk04;
    /* 08 */ STRUCT_PAD(0x08, 0x14);
    /* 14 */ u8 flags14;
};

extern struct RankRamUnk gUnk_0202BCEC;
extern u8 gUnk_020230E8[];

extern u8 gUnk_08AC718C[];

void LoadLegacyUiFrameGraphics(void);
void j_TmApplyTsa(u16 * dst, const void * src, int size);
void Decompress(const void * src, void * dst);
u8 GetChapterTacticsRank(void);
u8 GetChapterSurvivalRank(void);
u32 GetGameClock(void);
u32 GetGameTotalTime_unused(void);
void StartParallelWorker(ProcPtr func, ProcPtr parent);
void StartMixPalette(const void * a, const void * b, int c, int d, int e, void * f);
void EndingDetails_PutSprites(struct GameRankProc * proc);
u8 GetChapterCombatRank(void);
u8 GetOverallRankFrom3(int a, int b, int c);

void sub_80BCA74(struct GameRankProc * proc)
{
    u16 hours;
    u16 minutes;
    u16 seconds;
    u16 i;
    u8 * tm;

    proc->unk30 = 0;
    proc->unk2c = 0;

    LoadLegacyUiFrameGraphics();
    j_TmApplyTsa((u16 *)0x020234A8, gUnk_08AC718C, 0x80 << 5);
    CopyToPaletteBuffer(Pal_PlayerRankSpritesJp_Obj8_9, (0xc0 << 2), 0x40);
    Decompress(Img_PlayerRankSpritesJp, (void *)0x06011000);

    for (i = 0; i < 5; i++)
        CopyToPaletteBuffer(Pal_PlayerRankSpritesJp_Obj10_14, ((i + 0x1a) << 5), 0x20);

    CopyToPaletteBuffer(Pal_PlayerRankSpritesJp_Obj15, (0xf8 << 2), 0x20);
    CopyToPaletteBuffer(Pal_PlayerRankSpritesJp_Obj6, (0xb0 << 2), 0x20);
    CopyToPaletteBuffer(Pal_PlayerRankSpritesJp_Obj7Anim, (0xb8 << 2), 0x20);
    BG_EnableSyncByMask(0xf);

    if (gUnk_0202BCEC.flags14 & 0x80)
    {
        FormatTime(GetGameClock() - gUnk_0202BCEC.unk04, &hours, &minutes, &seconds);
        proc->ranks[0] = GetChapterTacticsRank();
        proc->ranks[1] = GetChapterSurvivalRank();
        proc->ranks[2] = GetChapterCombatRank();
        proc->ranks[3] = GetOverallRankFrom3(proc->ranks[0], proc->ranks[1], proc->ranks[2]);
        StartBgm(0x40, NULL);
    }
    else
    {
        FormatTime(GetGameTotalTime_unused(), &hours, &minutes, &seconds);
        proc->ranks[0] = GetGameTacticsRank();
        proc->ranks[1] = GetGameSurvivalRank();
        proc->ranks[2] = GetGameFundsRank();
        proc->ranks[3] = GetGameExpRank();
        proc->ranks[4] = GetGameCombatRank();
        proc->ranks[5] = GetOverallRank(proc->ranks[0], proc->ranks[1], proc->ranks[2],
            proc->ranks[3], proc->ranks[4]);
        StartBgm(0x40, NULL);
    }

    tm = gUnk_020230E8;
    PutNumber((u16 *)(tm + 0xa), 2, hours);
    PutSpecialChar((u16 *)(tm + 0xc), 2, 0x20);
    PutNumber2Digit((u16 *)(tm + 0x10), 2, minutes);
    PutSpecialChar((u16 *)(tm + 0x12), 2, 0x20);
    PutNumber2Digit((u16 *)(tm + 0x16), 2, seconds);

    for (i = 0; i < 6; i++)
    {
        proc->unk4c[i] = 0;
        proc->unk46[i] = 1;
        proc->unk40[i] = 0;
    }

    StartParallelWorker(EndingDetails_PutSprites, proc);
    StartMixPalette(Pal_PlayerRankSpritesJp_Obj7Anim, Pal_PlayerRankSpritesJp_Obj7Anim + 16, 2, 0x17, 1, proc);
}
