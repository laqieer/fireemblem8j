#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

/*
 * JP-only augury rank-sprite animator.
 *
 * Harvested from the score-0 decomp.me fork l4bts by TsilaAllaoui.  The
 * register declarations and empty constraints reproduce the JP live ranges:
 * row data stays in r6, affine outputs stay in r6/r5/r4 across later Div
 * calls, and the loop induction value is committed before the branch split.
 */

extern const u16 * const gUnk_08A95478[];

void sub_80A2E4C(int);

#define DIVINATION_SIN_0 (*(const s16 *) 0x080DC15C)
#define DIVINATION_COS_0 (*(const s16 *) 0x080DC1DC)

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
};

void DivinationRankSpriteUpdate(struct DivinationSpriteProc * proc)
{
    int i;
    const u16 * const * data;
    int col;
    int yval;
    int new_var;
    int t;

    new_var = proc->unk2C;
    t = new_var;

    if ((t >> 3) <= 5)
    {
        proc->unk2C = (t += 2);

        if ((t >> 3) == 6)
            sub_80A2E4C(0xF);
    }

    {
        register u8 * pRow asm("r6");

        pRow = proc->rowCounts;
        yval = 0x11;

        for (i = 4; i >= 0; i--)
        {
            if (*pRow != 0xFF)
            {
                register int x asm("r4");
                register int xArg asm("r1");

                col = 0;

                if (col <= *pRow && col < (proc->unk2C >> 3))
                {
                    x = 0x50;
                    data = gUnk_08A95478;

                    do
                    {
                        xArg = col << 9;
                        xArg = x + xArg;
                        PutSpriteExt(4, xArg, yval + 0x100, *data++, 0xF380);
                        x += 0xF;
                        col++;
                    }
                    while (col <= *pRow && col < (proc->unk2C >> 3));
                }
            }

            pRow++;
            yval += 0x10;
        }
    }

    {
        register int sa asm("r6");
        register int sb_ asm("r5");
        register int sc asm("r4");
        int scale;

        i = 0;
        scale = 0x100;
        data = (const u16 * const *) 0x080DC15C;

        while (i <= 4)
        {
            int r = (proc->unk2C - ((i + 1) << 3)) << 5;
            int next = i + 1;

            if (r > scale)
            {
                r = 0x80;
                r <<= 1;
            }

            if (r > 0x20)
            {
                sa = Div(DIVINATION_COS_0 << 4, r);
                asm("" : "+r"(sa));
                sa = (s16) sa;
                sb_ = Div(-(*(const s16 *) data) << 4, scale);
                asm("" : "+r"(sb_));
                sb_ = (s16) sb_;
                sc = Div(*(const s16 *) data << 4, r);
                sc = (s16) sc;
                SetObjAffine(
                    i,
                    sa,
                    sb_,
                    sc,
                    ({
                        int q = Div(DIVINATION_COS_0 << 4, scale);
                        q = (s16) q;
                        q;
                    }));
            }
            else
            {
                sa = Div(DIVINATION_COS_0 << 4, 0x20);
                asm("" : "+r"(sa));
                sa = (s16) sa;
                sb_ = Div(-(*(const s16 *) data) << 4, scale);
                asm("" : "+r"(sb_));
                sb_ = (s16) sb_;
                sc = Div(*(const s16 *) data << 4, 0x20);
                sc = (s16) sc;
                SetObjAffine(
                    i,
                    sa,
                    sb_,
                    sc,
                    ({
                        int q = Div(DIVINATION_COS_0 << 4, scale);
                        q = (s16) q;
                        q;
                    }));
            }

            i = next;
        }
    }
}
