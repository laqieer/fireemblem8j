/* NON_MATCHING: byte source is asm/sub_80A2E64.s @ JP 0x080A2E64 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/80A2E64/residual.txt); near-match build flags: // FLAGS: -fno-gcse   (NOT -mjp-promote — see residual.txt).
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
// sub_80A2E64: JP-only divination/augury rotating-sprite OAM animator (no fe8u twin).
// Reconstructed from asm. gUnk_08A95478 needs a data-split at 0x08A95478 for the real carve;
// for the permuter seed it is an extern const u16*const[] alias.
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

extern const u16 *const gUnk_08A95478[];

void sub_80A2E4C(int);
int sub_80D6374(int value, int base);

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
};

void sub_80A2E64(struct DivinationSpriteProc * proc)
{
    int i, row, col, x, yval, t;
    s16 sa, sb_, sc, sd;
    u8 * pRow;

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
        {
            sa  = sub_80D6374(COS(0) << 4, r);
            sb_ = sub_80D6374(-SIN(0) << 4, 0x100);
            sc  = sub_80D6374(SIN(0) << 4, r);
            sd  = sub_80D6374(COS(0) << 4, 0x100);
            SetObjAffine(i, sa, sb_, sc, sd);
        }
        else
        {
            sa  = sub_80D6374(COS(0) << 4, 0x20);
            sb_ = sub_80D6374(-SIN(0) << 4, 0x100);
            sc  = sub_80D6374(SIN(0) << 4, 0x20);
            sd  = sub_80D6374(COS(0) << 4, 0x100);
            SetObjAffine(i, sa, sb_, sc, sd);
        }
    }
}
