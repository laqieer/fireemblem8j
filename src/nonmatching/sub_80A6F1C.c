/* NON_MATCHING: byte source is asm/sub_80A6F1C.s @ JP 0x080A6F1C (region-different,
 * JP-only "通信闘技場" (Link-Arena) record codec; carved_rom places those bytes). This
 * C DOCUMENTS the reconstruction and is NOT in make-compare: compiled only by
 * `make nonmatching`.  near-match build flags: // FLAGS: -O2   (matches the whole
 * link-arena codec TU: siblings sub_80A6D34 / sub_80A6E4C are also -O2 residuals).
 *
 * Proposed name: DecodeAndVerifyArenaRecord (JP link-arena record DECODE + VERIFY).
 * This is the decode/verify counterpart of the ENCODE mirror sub_80A6E4C and calls
 * the header-DECODE leaf sub_80A6D34 (both same-TU JP-only codec funcs). Semantics
 * are proven correct against asm/sub_80A6F1C.s:
 *   1. sub_80A6D34()                         de-interleave the 3 header words
 *   2. *(int*)0x02014F24 = hdr[0]            SEED the sub_80A6AA8 LCG from hdr word0
 *   3. chk  = sub_80A6C20(payload, hdr[3])   checksum of the STILL-obfuscated payload
 *   4. a    = sub_80A6AA8()                  1st PRNG snapshot (verify tag A)
 *   5. for i<hdr[3]: payload[i] =            de-obfuscate: subtract rolling PRNG,
 *          (payload[i] - sub_80A6AA8()) & gUnk_02014EF0   mask to field width
 *   6. b    = sub_80A6AA8()                  2nd PRNG snapshot (verify tag B)
 *   7. consume(&cbarg, payload)              caller callback consumes the plaintext;
 *                                            cbarg (=0) is an in/out int by address
 *   8. chk2 = sub_80A6C20(payload, hdr[3])   checksum of the DE-obfuscated payload
 *   9. return  hdr[1] == ((chk2 + a) & 0x3FF)  &&  hdr[2] == ((chk + b) & 0x3FF)
 * i.e. "packet valid" iff both 10-bit verify tags in the header reconstruct.
 *
 * ===== EXACT BLOCKING CLASS: callback-in-a-high-reg via `_call_viaN` veneer =====
 * The callback pointer (arg0) MUST stay live ACROSS the sub_80A6D34 call, so agbcc
 * parks it in a callee-saved high register and invokes it through a thumb
 * `_call_via_rN` veneer.  The JP build picks r9 (sb) -> `bl _call_via_r9`
 * (0x080D65E0).  agbcc from portable C picks a DIFFERENT high reg -> a DIFFERENT
 * veneer symbol, so the linked bytes differ.  This is the SAME residual class the
 * sibling encode fn sub_80A6E4C documents (it parks its callback in r3 ->
 * `_call_via_r3` @0x080D65C8; veneer table: r5@0D65D0 r6@0D65D4 r7@0D65D8, i.e.
 * base+reg*4, giving r9 = 0x080D65E0).  Two source-shape probes were run:
 *
 *   (A) independent locals `u16 a,b; int cbarg;` (THIS body): agbcc holds `a` and
 *       `chk` in high regs (r8/r9) and colors the callback into sl(r10) ->
 *       `bl _call_via_sl`; 3 high callee-saved, `sub sp,#4`.  Register-normalized
 *       structural diff vs JP = the coloring only; logic identical.
 *   (B) struct-on-stack `struct{u16 a,b; int cbarg;}` (to force the JP stack layout
 *       sp+0=a, sp+2=b, sp+4=cbarg): reproduces the JP FRAME exactly (2 high
 *       callee-saved, `sub sp,#8`, `push {r6,r7}`) BUT (i) packs a,b into one word
 *       with a read-modify-write `ands #0xffff0000; orrs; str` instead of the JP
 *       clean `strh [sp]; strh [sp,#2]`, and (ii) colors the callback into r8 ->
 *       `_call_via_r8`, not r9.
 * Neither shape induces agbcc to (spill a,b as clean separate strh slots) AND
 * (color the callback specifically into r9).  That is a GLOBAL allocation decision
 * the JP build made that no source shape induces -- decomp-permuter territory,
 * identical in kind to the sub_80A6D34 plateau. NOT graduated: the linked-byte diff
 * is well beyond the ~10-byte cheap-permuter window (frame size, push count,
 * spill-vs-hold, veneer register), so no marathon was run.
 *
 * Graduate (only on a real score-0): move to src/, add the -O2 CC1FLAGS line, flip
 * the carved_rom row (0A6F1C -> src/sub_80A6F1C.o + drop the placeholder), drop
 * asm/sub_80A6F1C.s, AND add a NEW baseline symbol row `_call_via_r9 080D65E0 thumb`
 * (currently NOT a baseline symbol -- its bytes stay in asm until MATCHED). */
#include "global.h"

extern int gUnk_02014EF0;   /* (1<<bits)-1 field mask */
extern int gUnk_02014EF4;   /* header byte count      */

void sub_80A6D34(void);            /* JP link-arena header DECODE (same TU)      */
u16 sub_80A6C20(u8 * buf, int len); /* rolling byte checksum                     */
u16 sub_80A6AA8(void);              /* LCG PRNG seeded from *(int*)0x02014F24     */

int sub_80A6F1C(void (*consume)(int *, u8 *))
{
    int i;
    u16 a;
    u16 b;
    int cbarg;
    u16 chk;
    u8 *arg;
    u16 *base;

    cbarg = 0;

    sub_80A6D34();

    base = (u16 *)0x02014FC8;
    *(int *)0x02014F24 = base[0];

    arg = (u8 *)(gUnk_02014EF4 + 0x02014F28);
    chk = sub_80A6C20(arg, base[3]);

    a = sub_80A6AA8();

    for (i = 0; i < base[3]; i++)
    {
        arg[i] = (arg[i] - sub_80A6AA8()) & gUnk_02014EF0;
    }

    b = sub_80A6AA8();

    consume(&cbarg, arg);

    if (base[1] == ((sub_80A6C20(arg, base[3]) + a) & 0x3FF) &&
        base[2] == ((chk + b) & 0x3FF))
    {
        return 1;
    }

    return 0;
}
