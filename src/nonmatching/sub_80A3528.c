/* NON_MATCHING: byte source is asm/sub_80A3528.s @ JP 0x080A3528 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc invariant-scheduling / reg-coloring vs the JP build (see blocking
 * diff below); near-match build flags: // FLAGS: -Os  (and plain -O2 is byte-identical
 * for this function -- confirmed).  Do NOT use -fno-gcse (un-CSEs the base reloads).
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm.
 *
 * proposed_name: DrawAuguryResultPanel  (keep struct AuguryProc; or keep sub_80A3528)
 *
 * === STATUS: ~95% carved.  PROLOGUE byte-exact; both LOOP BODIES byte-exact. ===
 * The loop-body induction form was cracked with the "byte-offset cast" idiom
 *   dst = (u16*)((u8*)tm + off);  off = 256, off += 128 per iter
 * which reproduces the ROM `adds r1, off, base` (NO per-iter lsls) -- using u16-unit
 * offsets forces an extra `lsls #1`, and TILEMAP_LOCATED/`32*row` keeps a `lsls #6`.
 *
 * === EXACT BLOCKING DIFF (valid branch preheader, mine=RIGHT) ===
 * ROM hoists SIX loop-invariant field/base addresses into the loop preheader and
 * keeps them (r9/sl + 4 stack slots), reusing r1 for &winCount = &turnsB+0xd; the
 * tilemap base 0x02023CAC is then REMATERIALIZED per-use into a LOW reg (r4).  My
 * agbcc emits each proc+offset at its post-loop point-of-use instead and KEEPS the
 * tilemap base hoisted in a HIGH callee-saved reg (r8), so the whole tail re-colors:
 *
 *   ROM (target)                         mine (agbcc, both -O2 and -Os identical)
 *   a357e movs r0,#0x40                   (absent -- computed later at point of use)
 *   a3580 adds r0,r0,r5 ; mov r9,r0       &turnsA hoisted -> r9
 *   a3584 adds r1,r5 ; adds r1,#0x41
 *   a3588 str  r1,[sp,#0xc]               &turnsB hoisted -> [sp+0xc]
 *   a358a adds r2,r5 ; adds r2,#0x42
 *   a358e str  r2,[sp,#0x10]              &turnsC hoisted -> [sp+0x10]
 *   a3590 adds r3,r5 ; adds r3,#0x39
 *   a3594 str  r3,[sp,#8]                 &overallRank hoisted -> [sp+8]
 *   a3596 movs r0,#0x3d ; adds r0,r0,r5
 *   a359a mov  sl,r0                      &unlocked hoisted -> sl
 *   a359c adds r1,#0xd ; str r1,[sp,#0x14] &winCount = &turnsB+0xd  (r1 REUSED)
 *   ... loop body identical ...           ... loop body identical ...
 *   (base 0x02023CAC ldr'd into r4 each   (base kept in r8: `add r1,r8` throughout,
 *    use: `adds r1, r6, r4`)               ~+2 prologue instrs, whole tail re-colored)
 *
 * mine's valid-branch preheader is ~30 bytes SHORTER (no hoists); the loop exits to
 * a3740 vs ROM a3750.  This is a pure agbcc invariant-scheduling + register-coloring
 * divergence: agbcc will not (a) pre-schedule the >0x1f field-offset address adds into
 * the preheader, nor (b) rematerialize the address-constant base into a low reg while
 * hoisting &turnsA instead.  Explored: walking-pointer, TILEMAP_LOCATED, u16-unit off,
 * byte-unit off, tm-before/after-loop, inline-const vs tm-variable base, -O2 vs -Os.
 * One capped permuter pass (9797 iterations, -j4, --stop-on-zero) did NOT converge
 * (base object-score 8135 -> best 2645, never 0; object score is reloc-noise-inflated,
 * asm-differ on linked bytes is the true near-match view).  Matches the repo's
 * documented agbcc reg-alloc/instruction-ordering dead-end (.claude/permuter-running.md).
 *
 * notes_for_P10_integration: to re-wire when a lever cracks it --
 *   objects.lst auto-generates from carved_rom.d (no manual edit);
 *   add carved_rom.d row `0A3528<TAB>0A3898<TAB>src/sub_80A3528.o(.text)<TAB>handdecomp: sub_80A3528`
 *     and git rm layout/carved_rom.d/gbadisasm_sub_80A3528.tsv;
 *   add baseline_syms.d aliases gUnknown_08A95524@0x08A95524, gUnknown_08A9553C@0x08A9553C;
 *   gUnknown_08A95438 is the ALREADY-placed sym gPrepItemTextMsgIds (msgid table) -- reuse, do NOT re-alias;
 *   extern void sub_80A34F0(int,int,int,int,int) is the carved sibling (no header);
 *   if -Os add a Makefile CC1FLAGS line mirroring src/sub_80A6C60.o (else -O2 needs none);
 *   git rm asm/sub_80A3528.s. */
#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "functions.h"

// sub_80A3528: JP-only augury/divination result-panel DRAW (no fe8u twin).
// Paints the divination title, five rank rows, score, H:MM:SS clear-time,
// overall-rank icon and win count into the BG2 tilemap.
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
extern const u32 gPrepItemTextMsgIds[5]; // placed data sym @0x08A95438 (was gUnknown_08A95438)
extern const u32 gUnknown_08A95524[];

void sub_80A3528(struct AuguryProc * proc)
{
    int i;
    int row;
    int off;
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
        p = gPrepItemTextMsgIds;

        for (i = 4, off = 256; i >= 0; i--, off += 128)
        {
            PutDrawText(0, (u16 *)((u8 *)tm + off), 0, 0, 5,
                        GetStringFromIndex(*p++));
        }

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

        for (i = 0, row = 4, off = 256; i <= 4; i++, row += 2, off += 128)
        {
            PutDrawText(0, (u16 *)((u8 *)tm + off), 1, 0, 5,
                        GetStringFromIndex(gPrepItemTextMsgIds[i]));
            sub_80A34F0(8, row, 1, 20, 3);
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
