/* NON_MATCHING: byte source is asm/sub_800A34C.s @ JP 0x0800A34C (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Residual = agbcc spill-decision/reg-coloring vs the JP build (see
 * /tmp/longperm/800A34C/residual.txt); near-match build flags: // FLAGS: -fno-gcse   (REQUIRED — plain -O2 = 0x258/604B (+20); -fno-gcse = 0x248/584B EXACT).
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm. */
// sub_800A34C: JP-only Catmull-Rom / natural-cubic-spline 2D evaluator (no fe8u twin).
// Reconstructed from asm + IDA. sub_800A194 = Thomas-algorithm coeff solve; sub_80D6378 =
// fixed-point >>12 multiply (sub_80D6378(0x1000, u*coeff)). The uninitialized `int r;` return
// is intentional (asm `pop {r0}; bx r0` returns the leftover r0).
#include "global.h"

extern int sub_800A194(int *a, int *b, int *c, int *d, int n);
extern int sub_80D6378(int a, int b);

int sub_800A34C(int *pts, int *out, u16 *times, unsigned int t, int count)
{
    unsigned int ti;
    int i;
    int last;
    int k;
    unsigned int u;
    u16 *tp;
    int sub[4];
    int coeffA[4];
    int coeffB[4];
    int tan[8];
    int *tx;
    int *ty;
    int *txw;
    int *dp;
    int *p;
    int *ep0, *ep1;
    int px0, px1, py0, py1;
    int m0x, m1x, m0y, m1y;
    int ax, bx, ay, by, r;

    ti = t >> 12;
    i = 0;
    tx = &tan[0];
    ty = &tan[1];

    if (count - 1 > 0 && (ti < times[0] || ti >= times[1]))
    {
        do
        {
            i = i + 1;
            if (i >= count - 1)
                break;
            tp = &times[i];
        }
        while (ti < tp[0] || ti >= tp[1]);
    }

    coeffA[0] = 0x2000;
    coeffB[0] = 0x1000;
    tx[0] = -3 * (pts[0] - pts[2]);
    ty[0] = -3 * (pts[1] - pts[3]);
    last = count - 1;
    p = pts;
    if (count - 1 > 1)
    {
        dp = &sub[1];
        txw = tx + 2;
        for (k = 1; k < count - 1; k++)
        {
            *dp++ = 0x1000;
            coeffA[k] = 0x4000;
            coeffB[k] = 0x1000;
            *txw = -3 * (p[0] - p[4]);
            ty[2 * k] = -3 * (p[1] - p[5]);
            p += 2;
            txw += 2;
        }
    }

    sub[last] = 0x1000;
    coeffA[last] = 0x2000;
    ep0 = &pts[8 * count / 4 - 4];
    ep1 = &pts[8 * count / 4 - 2];
    tx[2 * last] = -3 * (ep0[0] - ep1[0]);
    ty[2 * last] = -3 * (ep0[1] - ep1[1]);

    sub_800A194(coeffA, coeffB, sub, tx, count);

    if (i >= last)
    {
        out[0] = ep1[0];
        out[1] = ep1[1];
        return r;
    }

    u = (t - (times[i] << 12)) / (times[i + 1] - times[i]);
    px0 = pts[2 * i];
    px1 = pts[2 * i + 2];
    m0x = tx[2 * i];
    m1x = tx[2 * (i + 1)];
    ax = 2 * (px0 - px1) + m0x + m1x;
    bx = 3 * (px1 - px0) - 2 * m0x - m1x;
    py0 = pts[2 * i + 1];
    py1 = pts[2 * i + 3];
    m0y = ty[2 * i];
    m1y = ty[2 * (i + 1)];
    ay = 2 * (py0 - py1) + m0y + m1y;
    by = 3 * (py1 - py0) - 2 * m0y - m1y;

    out[0] = sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * ax) + bx)) + m0x)) + px0;
    out[1] = sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * (sub_80D6378(0x1000, u * ay) + by)) + m0y)) + py0;

    return r;
}
