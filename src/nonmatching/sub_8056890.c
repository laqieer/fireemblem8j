/* NON_MATCHING: byte source is asm/sub_8056890.s @ JP 0x08056890 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 *
 * EfxAdvanceFrameLut = banim-ekrutils.c in fe8u. It is NOT a fe8u-NONMATCHING
 * function (D287-CORRECTION style fix): fe8u matches it WITH a `register u32 r6
 * asm("r6")` pin, but the JP build colors differently (count -> r6 naturally,
 * time -> r1, iframe unified into a single sign-extended `int`, returned directly).
 * Port below (no r6 pin, `int iframe` to drop the trailing sign-extend, literal
 * sentinel returns to keep the 6 independent `movs #N; negs` constants) reduces the
 * residual to TWO things, both pure permuter/coloring territory:
 *   A) +2 insns: the `iframe == -4` check compiles as `bne; <return>` (fall-through
 *      sentinel-return block) instead of the oracle's `beq shared_return`, so the
 *      sentinel return is duplicated from the normal-path return. agbcc won't
 *      cross-jump them because the -4 case falls through into the early return.
 *      The goto/&&/single-return forms that would share the return instead trigger
 *      constant-CSE reassociation (`subs r0,#5; adds r0,#1`), losing the 6 negs.
 *      No -O2 flag bridges the two (swept -fno-gcse/-fno-cse-follow-jumps/-fno-
 *      strength-reduce/-Os/...). It is a branch-polarity flip on the last sentinel.
 *   B) load coloring: oracle routes time -> r0 -> r1 and count -> r6 directly;
 *      this build routes time -> r1 directly and count -> r0 -> r6 (tied to the
 *      `--*ptime` decrement path wanting time in r0). Same insn count, reg-only.
 * Both are exactly what decomp-permuter's branch/temp/reorder passes flip.
 * Graduate via permuter -> move to src/, add the perfrag row, drop asm.
 *
 * NEGATIVE RESULT (2026-06-26): tried the EXACT fe8u banim-ekrutils.c form — the
 * `register u32 r6 asm("r6")` pin + dual load (`uframe`=u16 AND `iframe`=int both
 * = lut[count*2], return uframe) + Yoda `-1==iframe` conditions. Against the JP ROM
 * it is 117/132 differing (WORSE than this unified-int base's 87/132). So the JP build
 * does NOT use the fe8u source shape here; this base is the better permuter starting
 * point. Don't re-try the r6-pin/dual-load form. */
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

s16 EfxAdvanceFrameLut(s16 *ptime, s16 *pcount, const s16 lut[])
{
    int iframe;
    u16 count;
    u16 time;
    u16 tmp, time2, count2;

    time = *ptime;
    if (time == 0) {
        count = *pcount;
        iframe = lut[count * 2];

        if (iframe == -1)
            return -1;
        if (iframe == -6)
            return -6;
        if (iframe == -5)
            return -5;
        if (iframe == -4)
            return -4;

        if (iframe == -2) {
            *pcount = time;
            iframe = lut[0];
        } else if (iframe == -3) {
            *pcount = count - 1;
            tmp = *pcount;
            iframe = lut[tmp * 2];
        }

        count2 = *pcount;
        time2 = lut[count2 * 2 + 1];
        ++*(vs16 *)pcount;
        *ptime = time2 - 1;
        return iframe;
    } else {
        --*ptime;
        return -7;
    }
}
