/* NON_MATCHING: byte source is asm/sub_80CAEF4.s @ JP 0x080CAEF4 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/80CAEF4/residual.txt); near-match build flags: // FLAGS: (plain agbcc — NO -mjp-promote).
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
// sub_80CAEF4: JP-only 4bpp tile deinterleave (no fe8u twin). Reconstructed from asm.
// sub_80D636C = ROM fast-copy (src,dst,mode); proto matches src/sub_8067884.c.
#include "global.h"
#include "hardware.h"

extern void sub_80D636C(const void * src, void * dst, int mode);

void sub_80CAEF4(int a, int b)
{
    u8 * buf;
    u8 * vram;
    int pass;
    int row;
    u8 * src_hi;
    u8 * src_lo;
    u8 * dst_hi;
    u8 * dst_lo;
    int i;

    buf = (u8 *)0x02020188;
    vram = (u8 *)0x06013400;

    if (b != 0)
        b = b + 1;

    pass = 0;
    do
    {
        for (row = b; row <= a; row++)
        {
            int hi = (7 - (row >> 3)) & 0x3FF;
            int lo = ((row >> 3) + 8) & 0x3FF;
            int odd = row & 1;
            int half = (row & 7) >> 1;

            dst_lo = vram + (lo << 5) + half;
            dst_hi = vram + (hi << 5) + 3 - half;
            src_lo = buf + (lo << 5) + half;
            src_hi = buf + (hi << 5) + 3 - half;

            for (i = 7; i >= 0; i--)
            {
                if (odd)
                {
                    *src_hi |= *dst_hi & 0xf;
                    *src_lo |= *dst_lo & 0xf0;
                }
                else
                {
                    *src_hi |= *dst_hi & 0xf0;
                    *src_lo |= *dst_lo & 0xf;
                }
                dst_lo += 4;
                src_lo += 4;
                dst_hi += 4;
                src_hi += 4;
            }
        }
        buf += 0x400;
        vram += 0x400;
        pass++;
    } while (pass <= 3);

    buf = (u8 *)0x02020188;
    {
        int idx = 0x230;
        for (i = 3; i >= 0; i--)
        {
            sub_80D636C(buf, (u8 *)0x06010000 + ((idx & 0x3FF) << 5), 0x80);
            buf += 0x400;
            idx += 0x20;
        }
    }
}
