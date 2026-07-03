/* NON_MATCHING: byte source is asm/sub_80A2E64.s @ JP 0x080A2E64 (carved_rom places
 * those bytes; this C DOCUMENTS the reconstruction and is NOT in make-compare --
 * built only by `make nonmatching`).
 *
 * proposed_name: DivinationRankSpriteUpdate  (per-frame update proc of the JP-only
 *   divination/augury rank-sprite animator; sibling proc poked via sub_80A2E4C).
 *
 * This reconstruction is FUNCTIONALLY EXACT and register-CLOSE (permuter base score
 * 5720 -> plateau ~1875 after 15k iters on 4 cores). It is a REGION-DIFFERENT
 * near-match blocked by an agbcc register-allocation / induction-variable-scheduling
 * tie-break the permuter's register+statement shuffling cannot cross -- the same
 * residual class as the cluster sibling sub_80A3300 (call-saved register swap).
 *
 * FLAGS: plain -O2 (the Makefile default). The draft's "-fno-gcse" annotation is
 *   WRONG -- verified empirically: -fno-gcse makes it WORSE (objdump-diff 295 -> 317
 *   lines). -fno-strength-reduce collapses the 2-insn gap but flips gUnk_08A95478[col]
 *   from the ROM's pointer-walk to an indexed load (still nonmatching). Neither is the
 *   build flag; do not add one.
 *
 * EXACT BLOCKING DIFF (this C, -O2, vs asm/sub_80A2E64.s):
 *   (a) IV SCHEDULING (+2 insns, stack 0xC -> 0x14): agbcc hoists the outer loop's
 *       "next" induction values (pRow+1, yval+0x10, row-1) to the TOP of the loop body
 *       and double-buffers yval in a second stack slot; the ROM POST-increments them at
 *       the loop bottom (`adds r6,#1` / `ldr[sp,#8];adds#0x10;str` / `add r8,#-1`) with a
 *       single yval slot. This is the sole structural (non-register) delta.
 *   (b) REGISTER COLORING (cascades from (a)): the ROM keeps `proc` in a call-saved
 *       register the whole function (r9/sb) and colors {row->r8, gUnk_base->sl(r10),
 *       i->r8, 0x100->r7, x->r4, col->r5, pRow->r6}; every reconstruction agbcc emits
 *       either spills `proc` to [sp,#4] or permutes these assignments (r8<->r9, sl<->r9,
 *       r4<->r5<->r6). A pure coloring tie-break with no source lever.
 *
 * Graduation path: a lever that stops agbcc creating the extra outer-loop IV (diff (a))
 * would likely fall to the coloring; none found among {SetObjAffineAuto macro form vs
 * expanded, for-clause vs body increments, flag toggles}. Left for a deeper permuter/
 * hand-asm pass. gUnk_08A95478 needs a data-split (or alias) at 0x08A95478 for the real
 * carve; it is SHARED with sub_80A3300 -- declare the alias ONCE at integration. */
// sub_80A2E64: JP-only divination/augury rotating rank-sprite OAM animator (no fe8u twin).
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

extern const u16 *const gUnk_08A95478[];

void sub_80A2E4C(int);

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
};

void sub_80A2E64(struct DivinationSpriteProc * proc)
{
    int i, col;
    int x, yval;
    int t;
    u8 * pRow;
    int row;

    t = proc->unk2C;
    if ((t >> 3) <= 5)
    {
        t += 2;
        proc->unk2C = t;
        if ((t >> 3) == 6)
            sub_80A2E4C(0xF);
    }

    pRow = proc->rowCounts;
    yval = 0x11;
    for (row = 4; row >= 0; row--)
    {
        if (*pRow != 0xFF)
        {
            x = 0x50;
            for (col = 0; col <= *pRow && col < (proc->unk2C >> 3); col++)
            {
                PutSpriteExt(4, x + (col << 9), yval + 0x100, gUnk_08A95478[col], 0xF380);
                x += 0xF;
            }
        }
        pRow++;
        yval += 0x10;
    }

    for (i = 0; i <= 4; i++)
    {
        int r = (proc->unk2C - ((i + 1) << 3)) << 5;
        if (r > 0x100)
            r = 0x100;

        if (r > 0x20)
            SetObjAffineAuto(i, 0, r, 0x100);
        else
            SetObjAffineAuto(i, 0, 0x20, 0x100);
    }
}
