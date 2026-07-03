/* NON_MATCHING: byte source is asm/sub_8001570.s @ JP 0x08001570 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Proposed real name: AddAttr2dBitMap (module mapanim_eventcall; already the
 * declared name in include/hardware.h:380 and called from src/mapanim_eventcall.c
 * and 8 MapAnim/Summon fx TUs).
 *
 * fe8u twin: fireemblem8u/src/hardware.c:468 `AddAttr2dBitMap`. The US TU compiles
 * BYTE-IDENTICAL to fe8u's own src/hardware.o (verified) -> the US source is NOT
 * what built the JP function; JP is genuinely region-different (different agbcc
 * codegen shape). Under the project agbcc `-mjp-promote` lever the JP shape is
 * reproduced to within ONE instruction (see residual below).
 *
 * BUILD SHAPE: needs `-mjp-promote` (preserves s16 sign-extend + PROMOTE_FUNCTION_ARGS).
 *   plain -O2  -> 147 insns, spills _dst + 3 locals to stack (`sub sp,#16`) = far off.
 *   -mjp-promote -> 112 insns, no stack frame, keeps s16 originals in callee-saved
 *                   regs (matches JP exactly EXCEPT the one swap below).
 * // FLAGS: -mjp-promote   (wired: src/nonmatching/sub_8001570.o: CC1FLAGS += -mjp-promote)
 *
 * EXACT BLOCKING DIFF (asm-differ, target `<` vs this reconstruction `>`), the
 * ONLY residual — every other of the 112 instructions and all branch targets match:
 *
 *      adds  r2, r0, #1          ; height = _src[1] + 1  (r2)
 *   -  mov   ip, r6              ; TARGET: save _width (=width, r6) FIRST
 *      mov   r8, r2             ; save _height (=height, r2)
 *   +  mov   ip, r6              ; MINE:   save _width SECOND
 *
 * i.e. the two "save original width/height into callee-saved regs" copies
 * (`_width = width; _height = height;`) are emitted in the opposite order. Two
 * halfwords (`mov ip,r6` <-> `mov r8,r2`); identical registers, identical
 * addresses, identical everything else.
 *
 * AGBCC-WALL HYPOTHESIS: reg-allocator-internal save-order tie-break (D284 / the
 * docs/agbcc_codegen_levers.md sec.7 "genuine reg-allocator-internal" class). The
 * emission order of the two independent callee-saved copies is fixed by agbcc's
 * local-alloc, NOT by C-source order -> a source-reconstruction problem that
 * resists statement reordering.
 *
 * LEVERS / PERMUTER TRIED (all still leave exactly this one swap, or worse):
 *   - ~40 source-reconstruction variants: swap `_width=width;`/`_height=height;`
 *     order; decl order/adjacency; chained `_width=width=...`; interleave
 *     compute+save; scratch-temp hoist (`_iy=height;_height=_iy;`); explicit
 *     `rows`/`int` temp for the row multiply; swap multiply operands; local u8*
 *     for the header bytes; `1+X` vs `X+1`; move `++_src`/`_ix=_iy=0` around; the
 *     inner-loop `dst2`/`src` decl order (THIS one DID matter and IS applied).
 *   - `register asm("rN")` pins on _width/_height (r8/ip/r12 combos): all shatter
 *     the mjp-promote allocation (ndiff 66-107).
 *   - agbcc flag matrix over -mjp-promote: -Os, -O1, -fno-strict-aliasing,
 *     -fno-expensive-optimizations, -fno-strength-reduce, -fno-gcse, -fno-force-mem,
 *     -fno-schedule-insns, -fno-peephole, -fno-caller-saves, -fno-thread-jumps,
 *     -fno-cse-follow-jumps, -f(no-)rerun-cse-after-loop, -fno-defer-pop — none flip it.
 *   - decomp-permuter: one real batch, 67k iterations, -j8. It reports "score 0"
 *     candidates but these are the KNOWN agbcc "invalid zero scores" false positives
 *     (see permuter_settings.toml): recompiled via compile.sh they STILL carry this
 *     swap. So the permuter did NOT solve it.
 *
 * GRADUATE VIA: a permuter build with the agbcc invalid-zero-score fix, or the
 * original IS-build agbcc reg-allocator. On a real score-0: move to src/, flip the
 * carved_rom row (asm/sub_8001570.o -> src/sub_8001570.o(.text), keep VMAs
 * 001570 001650), drop asm/sub_8001570.s, drop the baseline alias via
 * layout/baseline_syms_drop.d/rename_AddAttr2dBitMap.tsv (already present), and
 * retarget the -mjp-promote line to src/sub_8001570.o. No `.thumb_set` bridge
 * needed: no DATA table references the old `sub_8001570` symbol (all callers use
 * AddAttr2dBitMap). */
#include "global.h"
#include "hardware.h"

void AddAttr2dBitMap(u16 * _dst, u16 * _src, s16 ix, s16 iy, u16 chr) // TODO: handle type of a1
{
    u16 *dst;
    s16 width, height;
    s16 _width;
    s16 _height;
    s16 _ix, _iy;

    width = ((u8 *)_src)[0] + 1;
    height = ((u8 *)_src)[1] + 1;
    _width = width;
    _height = height;
    ++_src;
    _iy = 0;
    _ix = 0;

    if (ix + width > 0x20)
        width = 0x20 - ix;

    if (ix < 0)
    {
        _ix = -ix;
        width -= _ix;
        ix = 0;
    }

    if (width > 0)
    {
        int i, j;
        if (iy + height > 0x20)
            height = 0x20 - iy;

        if (iy < 0)
        {
            _iy = -iy;
            height -= _iy;
            iy = 0;
        }

        if (height > 0)
        {
            _src += _width * (_height - (_iy + height));
            dst = _dst + (iy + height - 1) * 0x20 + ix;

            for (i = height - 1; i >= 0; --i)
            {
                u16 *dst2 = dst;
                const u16 *src = _src + _ix;

                for (j = 0; width > j; ++j)
                {
                    *dst2 = *src + chr;
                    ++src;
                    ++dst2;
                }

                _src += _width;
                dst -= 0x20;
            }
        }
    }
}
