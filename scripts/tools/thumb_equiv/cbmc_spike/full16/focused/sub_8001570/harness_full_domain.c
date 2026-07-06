/* Full-domain sub_8001570 m2c-trust harness.
 * Inputs are full symbolic.  Source memory is a shared UF-backed array oracle
 * (run CBMC with --arrays-uf-always); destination observability is checked by an
 * arbitrary symbolic dst index, which is universal in CBMC's nondet semantics.
 */
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef _Bool bool;

int nondet_int(void);
unsigned int nondet_uint(void);
unsigned char nondet_uchar(void);

#define ASSUME(x) __CPROVER_assume(x)
#define ASSERT(x, m) __CPROVER_assert((x), (m))
#define GUARD_GLOBAL_H
#define GUARD_HARDWARE_H
#define M2C_UNK s32
#define M2C_FIELD(expr, type_ptr, offset) (*(type_ptr)((s8 *)(expr) + (offset)))

#define AddAttr2dBitMap impl_AddAttr2dBitMap
#include "src/nonmatching/sub_8001570.c"
#undef AddAttr2dBitMap

#define AddAttr2dBitMap ref_AddAttr2dBitMap
#include "scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8001570/m2c_ref_byteptr_lowered.c"
#undef AddAttr2dBitMap

#define DST_PAD 512u
#define DST_WORDS 1024u
#define SRC_PAD 512u
#define SRC_WORDS 70000u

int main(void)
{
    u16 dst_impl[DST_PAD + DST_WORDS + DST_PAD];
    u16 dst_ref[DST_PAD + DST_WORDS + DST_PAD];
    u16 src_oracle[SRC_PAD + SRC_WORDS];
    unsigned k = nondet_uint();
    u16 old = nondet_uint();
    s16 ix = nondet_int();
    s16 iy = nondet_int();
    u16 chr = nondet_uint();
    u8 header_w = nondet_uchar();
    u8 header_h = nondet_uchar();

    ASSUME(k < DST_WORDS);
    dst_impl[DST_PAD + k] = old;
    dst_ref[DST_PAD + k] = old;

    /* Full symbolic header bytes: function width/height are header+1 (1..256). */
    src_oracle[SRC_PAD] = ((u16)header_h << 8) | header_w;

    impl_AddAttr2dBitMap(dst_impl + DST_PAD, src_oracle + SRC_PAD, ix, iy, chr);
    ref_AddAttr2dBitMap((u8 *)(dst_ref + DST_PAD), src_oracle + SRC_PAD, ix, iy, chr);

    ASSERT(dst_impl[DST_PAD + k] == dst_ref[DST_PAD + k], "sub_8001570 full-domain arbitrary dst word");
    return 0;
}
