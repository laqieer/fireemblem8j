/* NON_MATCHING: byte source is asm/sub_8084CE4.s @ JP 0x08084CE4 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * Previously unexamined; reconstructed this session to an 8-byte residual (D290).
 * It is a sin-distortion buffer fill: 80 iterations (i = 1,3,..,0x9F) indexing
 * gSinLookup (0x080DC15C), fixed-point multiply chain (sinval*arg2*abs(i-arg5)*arg6)
 * >> 20 + arg4, written at odd s16 positions (buf[1],buf[3],...). Likely an HBlank
 * scroll/wave effect table.
 * Build with -mjp-promote -fno-strength-reduce -> 128 bytes (oracle 120). The 8-byte
 * residual is the agbcc register-ALLOCATION wall (D290b): the JP build keeps the
 * walking pointer + gSinLookup in 2 high regs and angle/step as int-in-low-regs with
 * no sign-extend; this agbcc needs a 3rd high reg (extra push) for the s16 form or
 * carries the angle/step sign-extends for the int form -- neither reproduces the JP
 * coloring. Permuter target. */
#include "global.h"

extern s16 gSinLookup[];

void sub_8084CE4(s16 *buf, s16 arg1, s16 arg2, s16 arg3, s16 arg4, s16 arg5, s16 arg6)
{
    s16 i;
    s16 *dst = buf + 1;
    s16 angle = arg3 + arg1;
    s16 step = arg3 * 2;
    for (i = 1; i <= 0x9f; i += 2) {
        int sinval = gSinLookup[angle & 0xff];
        int v = sinval * arg2;
        int d = i - arg5;
        if (d < 0)
            d = arg5 - i;
        v = v * d;
        v = v * arg6;
        *dst = (v >> 20) + arg4;
        dst += 2;
        angle += step;
    }
}
