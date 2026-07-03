/* NON_MATCHING: byte source is asm/sub_80A6E4C.s @ JP 0x080A6E4C (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * Same TU as the MATCHED sub_80A6C60 and reconstructed sub_80A6D34 (link-arena codec).
 *
 * STATUS: structural byte-identical to JP; residual is the agbcc spill-decision /
 * register-coloring NEAR class (docs/agbcc_codegen_levers.md section 7 / D284) —
 * cf. UpdateLinkArenaMenuScrollBar (same link-arena TU, "body byte-perfect, only
 * the push reg-list differs"). At -O2 this reconstruction is 212B vs the 208B JP
 * slot (4B larger literal pool from extra reg-reloads), 152 differing .text bytes
 * (best source lever; 169 without the hdr-at-top reorder).
 *
 * EXACT BLOCKING DIFF (candidate vs JP, both structurally identical instr-for-instr):
 *   1. callback veneer: candidate emits `bl _call_via_r2` (func kept in r2); JP uses
 *      `bl _call_via_r3`. JP's clear-loop copies base into r2 as the loop bound
 *      (`adds r2,r6,#0; cmp r0,r2`), which evicts func to r3; candidate compares the
 *      bound against r6 directly, leaving r2 free for func.
 *   2. r4<->r5 role swap: JP colors hdr=r4, &gUnk_02014EF4=r5 (loaded at entry,
 *      before the clear loop); candidate colors &EF4=r4, hdr=r5 (loaded lazily).
 *      JP hoists the &EF4 address-load to the function prologue (GCSE placement);
 *      candidate keeps hdr live in a callee-saved reg and reloads count from it.
 *   3. loop2 base handling: JP copies base r6->r4 once before loop2 and reloads
 *      hdr[3] (count) from the literal pool each iteration; candidate uses r6
 *      directly and keeps hdr in a register — 4B smaller pool but wrong coloring.
 *
 * FLAG MATRIX (single-TU cmp vs oracle .text, all -O2 base): none=169, -fno-gcse=168,
 * -fcaller-saves=169, -fno-regmove=169, -O1=200B/171. Per D284 none crack the
 * spill-decision axis. decomp-permuter (-O2, -j4, tuned structural weights): base
 * score 2215 -> plateaued ~1170 over 62k iters (matches the documented 30-60k worker
 * plateau). Graduate via a long/lucky permuter run, then move to src/, flip the
 * carved_rom row (asm/sub_80A6E4C.o -> src/sub_80A6E4C.o) and drop asm/sub_80A6E4C.s.
 *
 * sub_80A6E4C: JP-only link-arena ("通信闘技場") record ENCODE/commit stage. Reverse-
 * clears gBuf[0..0x9f], invokes a caller callback (via _call_via_rN) to emit the
 * payload, seeds a nonce from GetGameClock()>>3, computes two sub_80A6C20 10-bit
 * checksums, LCG-obfuscates the buffer (sub_80A6AA8), interleaves the 30 header bits
 * (sub_80A6C60). Header @ (u16*)0x02014FC8: [0]=seed, [1]=checksumA, [2]=checksumB,
 * [3]=block count; seed mirrored to *(int*)0x02014F24. No fe8u twin.
 */
#include "global.h"

extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern u8 gBuf_2014F28[];

int sub_80A6A7C(int len);
int sub_80A6AA8(void);
u16 sub_80A6C20(u8 * buf, int len);
void sub_80A6C60(void);

void sub_80A6E4C(void (*func)(int *, u8 *))
{
    int len;
    int i;
    int addr;
    int base;
    u16 *hdr;

    len = 0;
    base = (int)gBuf_2014F28;
    hdr = (u16 *)0x02014FC8;

    addr = base + 0x9f;
    do
    {
        *(u8 *)addr = 0;
        addr--;
    } while (addr >= base);

    func(&len, (u8 *)(gUnk_02014EF4 + base));

    hdr[3] = sub_80A6A7C(len);
    hdr[1] = sub_80A6C20((u8 *)(gUnk_02014EF4 + base), hdr[3]);
    hdr[0] = ((GetGameClock() >> 3) + hdr[1]) & 0x3FF;
    *(int *)0x02014F24 = hdr[0];
    hdr[1] = (sub_80A6AA8() + hdr[1]) & 0x3FF;

    for (i = 0; i < hdr[3]; i++)
    {
        u8 *q;
        int t = sub_80A6AA8();
        q = (u8 *)(i + gUnk_02014EF4 + base);
        *q = (t + *q) & gUnk_02014EF0;
    }

    hdr[2] = (sub_80A6C20((u8 *)(gUnk_02014EF4 + 0x02014F28), hdr[3]) + sub_80A6AA8()) & 0x3FF;

    sub_80A6C60();
}
