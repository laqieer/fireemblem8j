#include "global.h"

//! Unidentified in fe8u (the score-0 decomp.me matcher kept the JP name too).
// JP 0x08084CE4 region-different: an HBlank sine-distortion buffer fill -- 80
// iterations (i = 1,3,..,0x9F) index gSinLookup, fixed-point multiply chain
// (sin * amp * abs(i - center) * scale) >> 20 + add, written at odd s16 slots
// (buf[1],buf[3],...). The fe8u-shaped C is an 8-byte reg-ALLOCATION-wall NEAR;
// the fork mbcFD (score 0) pins the walking pointer/gSinLookup/angle/step to the
// JP high+low registers and loads the three stack args via inline asm,
// reproducing the JP coloring byte-for-byte. gSinLookup is u8[] in-repo (address
// 0x080DC15C); reinterpreted as s16[] here exactly as the scratch does.
// (decomp.me fork mbcFD, score 0)

extern s16 gSinLookup[];

void sub_8084CE4(s16 *buf, s16 arg1, s16 arg2, s16 arg3, unsigned int arg4, s16 arg5, s16 arg6)
{
    register s16 *dst asm("r6");
    register int addTmp asm("r0");
    register int centerTmp asm("r4");
    int center;
    register int scale asm("r5");
    int a1;
    int amp;
    int *new_var2;
    register int i asm("r2");
    int *new_var;
    int a3;
    register int add asm("ip");
    register s16 *sinTable asm("r9");
    register int angle asm("r4");
    register int step asm("r3");

    asm("ldr %0, [sp, #0x1c]\n\tldr %1, [sp, #0x20]\n\tldr %2, [sp, #0x24]"
        : "=r"(addTmp), "=r"(centerTmp), "=r"(scale));
    do {
        a1 = arg1;
        amp = arg2;
    } while (0);

    a3 = arg3;
    dst = buf;
    add = (s16)addTmp;
    center = (s16)centerTmp;
    scale = (s16)scale;
    dst++;
    i = 1;
    sinTable = gSinLookup;
    angle = a3 + a1;
    step = a3 << 1;

    do {
        int mask;
        int sinval;
        int v;
        register int out asm("r1");
        register int d asm("r0");

        mask = 0xFF;
        mask &= angle;
        sinval = sinTable[mask];
        v = sinval * amp;
        d = i - center;

        if (d < 0)
            d = center - i;

        new_var2 = &v;
        d = d * v;
        asm("add %0, %1, #0" : "=r"(out) : "r"(d));
        out *= scale;
        d = out >> 20;
        new_var = new_var2;
        *dst = d + add;
        dst += 2;
        angle += step;
        i += 2;
    } while (i <= 0x9F);
}
