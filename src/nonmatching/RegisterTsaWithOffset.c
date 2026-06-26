/* NON_MATCHING: byte source is asm/sub_80D19DC.s @ JP 0x080D19DC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). Compiled only by
 * `make nonmatching`. Reconstructed verbatim from fe8u classchg-sel.c (struct + body).
 * RESIDUAL (2026-06-26 carve attempt): 91/96 bytes differ vs ROM. The ALGORITHM
 * matches but the JP build colors with higher register pressure (uses r8 + ip: keeps
 * _dst in r8, jrange<<16 in ip) that this fe8u-shaped C does not induce. This is a
 * reg-coloring NEAR for the permuter, NOT the "6-byte NEAR" the frontier claimed.
 * To carve: drop the RegisterTsaWithOffset baseline alias from
 * layout/baseline_syms.d/perfrag_classchg-sel.tsv (else multiple-def). */
#include "global.h"
#include "classchg.h"

struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset) {
    s16 i, j;
    s16 jrange;
    u16 *src;
    u16 *dst;
    u32 word;
    u8 mask;
    struct Struct_8A30978 *b = (void *)_src;
    u16 add = offset;
    src = b->longBuffer;
    mask = 0xff;
    word = *((u32*)b);
    jrange = b->a;
    i = (word >> 8) & mask;
    while (i > 0xc) {
        j = jrange;
        dst = _dst + i * 32;
        while (j >= 0) {
            *dst++ = (*src++) + add;
            j--;
        }
        i--;
    }
}
