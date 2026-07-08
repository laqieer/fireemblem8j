/* NON_MATCHING: byte source is asm/sub_80A2E64.s @ JP 0x080A2E64 (carved_rom places
 * those bytes; this C DOCUMENTS the reconstruction and is NOT in make-compare --
 * built only by `make nonmatching`).
 *
 * proposed_name: DivinationRankSpriteUpdate  (per-frame update proc of the JP-only
 *   divination/augury rank-sprite animator; sibling proc poked via sub_80A2E4C).
 *
 * Adopted from community decomp.me fork jWKEq by user TsilaAllaoui. This source
 * shape uses the fork's -fno-gcse codegen, explicit affine helper calls, and
 * register hints, improving the match rate from the old local reconstruction
 * while remaining proved-equivalent to the JP byte source:
 *   prove_nonmatching.py sub_80A2E64 -> PROVEN-BOUNDED(1)
 *   differential_test.py sub_80A2E64 --trials 60 -> EQUIV
 *
 * gUnk_08A95478 needs a data-split (or alias) at 0x08A95478 for the real carve;
 * it is SHARED with PutDivinationRankSprite -- declare the alias ONCE at integration. */
// sub_80A2E64: JP-only divination/augury rotating rank-sprite OAM animator (no fe8u twin).
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

extern const u16 *const gUnk_08A95478[];

void sub_80A2E4C(int);
int sub_80D6374(int value, int base);
void sub_8002100(int idx, s16 a, s16 b, s16 c, s16 d);

#define DIVINATION_SIN_0 (*(const s16 *) 0x080DC15C)
#define DIVINATION_COS_0 (*(const s16 *) 0x080DC1DC)

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
};

void sub_80A2E64(struct DivinationSpriteProc * proc)
{
    int i, row, col, yval, new_var, t;
    int sa, sb_, sc;
    register u8 * pRow asm("r6");

    new_var = proc->unk2C;
    t = new_var;
    if ((t >> 3) <= 5)
    {
        proc->unk2C = (t += 2);
        if ((t >> 3) == 6)
            sub_80A2E4C(0xF);
    }

    pRow = proc->rowCounts;
    yval = 0x11;
    for (row = 4; row >= 0; row--)
    {
        if (*pRow != 0xFF)
        {
            register int x asm("r4");
            const u16 * const * objs;

            col = 0;
            if (col <= *pRow && col < (proc->unk2C >> 3))
            {
                x = 0x50;
                objs = gUnk_08A95478;
                do
                {
                    PutSpriteExt(4, x + (col << 9), yval + 0x100, *objs++, 0xF380);
                    x += 0xF;
                    col++;
                } while (col <= *pRow && col < (proc->unk2C >> 3));
            }
        }
        pRow++;
        yval += 0x10;
    }

    i = 0;
    while (i <= 4)
    {
        int r = (proc->unk2C - ((i + 1) << 3)) << 5;
        int next = i + 1;
        if (r > 0x100)
            r = 0x100;

        if (r > 0x20)
        {
            sa = (s16) sub_80D6374(DIVINATION_COS_0 << 4, r);
            sb_ = (s16) sub_80D6374(-DIVINATION_SIN_0 << 4, 0x100);
            sc = (s16) sub_80D6374(DIVINATION_SIN_0 << 4, r);
            sub_8002100(i, sa, sb_, sc, (s16) sub_80D6374(DIVINATION_COS_0 << 4, 0x100));
        }
        else
        {
            sa = (s16) sub_80D6374(DIVINATION_COS_0 << 4, 0x20);
            sb_ = (s16) sub_80D6374(-DIVINATION_SIN_0 << 4, 0x100);
            sc = (s16) sub_80D6374(DIVINATION_SIN_0 << 4, 0x20);
            sub_8002100(i, sa, sb_, sc, (s16) sub_80D6374(DIVINATION_COS_0 << 4, 0x100));
        }

        i = next;
    }
}
