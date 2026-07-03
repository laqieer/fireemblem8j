/* NON_MATCHING: byte source is asm/sub_80A6D34.s @ JP 0x080A6D34 (region-different,
 * JP-only link-arena codec; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * near-match build flags: // FLAGS: -O2   (NOT -mjp-promote: no s16 args, verified
 * zero codegen delta; NOT -Os: sibling is -Os but D34 has higher reg pressure so -Os
 * emits 116 instrs vs the JP build's 120).
 *
 * Residual = PURE agbcc register-coloring vs the JP build. The instruction SEQUENCE
 * is byte-for-byte reproducible; the C semantics are proven correct against the asm
 * (checksum subtract, (x-chk)&mask, i%3 bucket, i/3 shift, i%bits stride, and the
 * i%3==1 quirk `& (i%3)` inherited from matched sibling sub_80A6C60). Only the
 * physical register assignment differs:
 *   JP build (target, 7 callee-saved): sl=held constant 0 (reused for j-loop entry
 *     guard AND packed-base `mov r0,sl; adds r6,r0,r1`), r9/sb=held &0x02014EEC
 *     ADDRESS (reloads *bits from it), r6=advancing packed pointer in a LOW reg
 *     (`adds r6,#1`), r8=hdr base 0x02014FC8, r7=i, r5=chk then i%3 temp, r4=bits.
 *   agbcc from this portable C (5 callee-saved): does NOT hoist &0x02014EEC into a
 *     high reg (pool reload `ldr[pc];ldr[.]` costs the same 2 insns locally, so no
 *     LOCAL incentive), and puts the advancing packed pointer in a HIGH reg making
 *     `dst++` an expensive `movs r1,#1; add r8,r1` instead of `adds r6,#1`.
 * Register-normalized structural diff = 24 lines, ALL of which are these mov/ldr
 * shuffles -- there is no logic difference. This is a GLOBAL allocation decision the
 * JP build made that no source shape induces; it is decomp-permuter territory.
 * Permuter status: plateaued at best score 1320 after ~113k combined iterations
 * (default + tuned-weights runs); compute-bound and re-runnable on uncontended cores.
 *
 * Graduate via permuter/lever -> move to src/, add the -O2 CC1FLAGS line, flip the
 * carved_rom row (0A6D34 -> src/sub_80A6D34.o), drop asm/sub_80A6D34.s.
 * Proposed name: keep sub_80A6D34 (JP link-arena header decode). */
// sub_80A6D34: JP-only "通信闘技場" (Link-Arena) record-codec header DECODE @ 0x080A6D34.
// Exact inverse of the MATCHED same-TU sibling sub_80A6C60 (which ENCODES the same 30
// header bits with the identical i%3 / i/3 / i%bits loop). De-obfuscates the packed
// buffer (subtract rolling checksum, mask to (1<<bits)-1) then de-interleaves 30 bits
// back into the 3 codec-header words at 0x02014FC8[0..2].
#include "global.h"

extern int gUnk_02014EF0;   /* (1<<bits)-1 field mask */
extern int gUnk_02014EF4;   /* header byte count      */
extern u8 gBuf_2014F28[];   /* 0x02014F28 packed buffer */

u16 sub_80A6C20(u8 * buf, int len);
void sub_80A6AC0(void);

void sub_80A6D34(void)
{
    int i;
    int j;
    u16 sb;
    u8 *src;
    u8 *arg;
    u16 *dst;
    u16 *base;

    i = 0;

    sub_80A6AC0();

    arg = (u8 *)(gUnk_02014EF4 + 0x02014F28);
    base = (u16 *)0x02014FC8;
    sb = sub_80A6C20(arg, base[3]);

    for (j = 0; j < gUnk_02014EF4; j++)
    {
        gBuf_2014F28[j] = (gBuf_2014F28[j] - sb) & gUnk_02014EF0;
    }

    base[0] = 0;
    base[1] = 0;
    base[2] = 0;

    src = (u8 *)0x02014F28;
    dst = base;

    do
    {
        register int bits asm("r4");

        if (i % 3 == 0)
        {
            bits = *src;
            bits >>= (i % *(int *)0x02014EEC);
            bits &= 1;
            bits <<= (i / 3);
            bits |= dst[0];
            dst[0] = bits;
        }
        else if (i % 3 == 1)
        {
            bits = *src;
            bits >>= (i % *(int *)0x02014EEC);
            bits &= (i % 3);
            bits <<= (i / 3);
            bits |= dst[1];
            dst[1] = bits;
        }
        else
        {
            bits = *src;
            bits >>= (i % *(int *)0x02014EEC);
            bits &= 1;
            bits <<= (i / 3);
            bits |= dst[2];
            dst[2] = bits;
        }

        i++;
        if (i % *(int *)0x02014EEC == 0)
            src++;
    } while (i != 0x1e);
}
