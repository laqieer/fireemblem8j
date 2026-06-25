/* NON_MATCHING: byte source is asm/sub_80A3528.s @ JP 0x080A3528 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/80A3528/residual.txt); near-match build flags: // FLAGS: (plain -O2 — -mjp-promote no effect; -fno-gcse HURTS, un-CSEs the gBG2+2 reloads).
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
// sub_80A3528: JP-only augury/divination result-panel DRAW (no fe8u twin).
// Reconstructed from IDA Hex-Rays + the carved sibling src/sub_80A34F0.c + caller sub_80A390C.
// Data deps (NEEDS_ALIAS for real carve): gUnknown_08A9553C / 08A95438 / 08A95524.
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "functions.h"

struct AuguryProc
{
    /* 00 */ STRUCT_PAD(0x00, 0x39);
    /* 39 */ u8 overallRank;
    /* 3A */ u8 unk3A;
    /* 3B */ u8 valid;
    /* 3C */ u8 index;
    /* 3D */ u8 unlocked;
    /* 3E */ STRUCT_PAD(0x3E, 0x40);
    /* 40 */ u8 turnsA;
    /* 41 */ u8 turnsB;
    /* 42 */ u8 turnsC;
    /* 43 */ STRUCT_PAD(0x43, 0x4E);
    /* 4E */ u8 winCount;
    /* 4F */ STRUCT_PAD(0x4F, 0x58);
    /* 58 */ int score;
};

extern void sub_80A34F0(int base, int row, int color, int id, int count);

extern const u32 gUnknown_08A9553C[];
extern const u32 gUnknown_08A95438[5];
extern const u32 gUnknown_08A95524[];

void sub_80A3528(struct AuguryProc * proc)
{
    int i;
    u16 * base;
    u16 * tm;
    const u32 * p;

    ResetText();
    base = gBG2TilemapBuffer;
    BG_Fill(base, 0);
    SetTextFontGlyphs(0);
    SetTextFont(0);

    PutDrawText(0, base + 34, 0, 0, 12, (char *)gUnknown_08A9553C[proc->index]);

    if (proc->valid)
    {
        tm = gBG2TilemapBuffer + 2;
        p = gUnknown_08A95438;

        for (i = 4; i >= 0; i--)
        {
            PutDrawText(0, tm + 128, 0, 0, 5, GetStringFromIndex(*p++));
            tm += 64;
        }

        tm = gBG2TilemapBuffer + 2;
        PutDrawText(0, tm + 142, 0, 0, 4, GetStringFromIndex(1232));
        PutNumber(tm + 152, 2, proc->score);
        PutSpecialChar(tm + 153, 3, 30);

        PutDrawText(0, tm + 206, 0, 0, 4, GetStringFromIndex(0x4D1));
        PutSpecialChar(tm + 212, 0, 32);
        PutSpecialChar(tm + 215, 0, 32);
        PutNumber(tm + 211, 2, proc->turnsA);
        PutNumber2Digit(tm + 214, 2, proc->turnsB);
        PutNumber2Digit(tm + 217, 2, proc->turnsC);

        PutDrawText(0, tm + 39, 3, 0, 5, GetStringFromIndex(0x4D2));
        PutSpecialChar(tm + 43, 4, gUnknown_08A95524[proc->overallRank]);

        if (!proc->unlocked)
            PutDrawText(0, tm + 46, 3, 0, 4, GetStringFromIndex(0x4D3));
        else
            PutDrawText(0, tm + 46, 3, 4, 4, GetStringFromIndex(0x4D4));

        tm = gBG2TilemapBuffer + 55;
        PutDrawText(0, tm, 3, 0, 2, GetStringFromIndex(0x4D5));
        PutNumber(tm + 2, 2, proc->winCount);
        PutDrawText(0, tm + 3, 3, 0, 2, GetStringFromIndex(0x4D6));
    }
    else
    {
        tm = gBG2TilemapBuffer + 2;

        for (i = 0; i <= 4; i++)
        {
            PutDrawText(0, tm + 64 * i + 128, 1, 0, 5,
                        GetStringFromIndex(gUnknown_08A95438[i]));
            sub_80A34F0(8, 2 * i + 4, 1, 20, 3);
        }

        PutDrawText(0, tm + 142, 1, 0, 4, GetStringFromIndex(1232));
        sub_80A34F0(21, 7, 1, 20, 3);

        PutDrawText(0, tm + 206, 1, 0, 4, GetStringFromIndex(0x4D1));
        sub_80A34F0(21, 9, 1, 20, 3);

        PutDrawText(0, tm + 39, 1, 0, 5, GetStringFromIndex(0x4D2));
        sub_80A34F0(13, 1, 1, 20, 1);

        if (!proc->unlocked)
            PutDrawText(0, tm + 46, 1, 0, 4, GetStringFromIndex(0x4D3));
        else
            PutDrawText(0, tm + 46, 1, 4, 4, GetStringFromIndex(0x4D4));

        sub_80A34F0(23, 1, 1, 20, 4);
    }

    BG_EnableSyncByMask(4);
}
