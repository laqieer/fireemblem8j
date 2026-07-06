typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16; typedef int s32; typedef unsigned int u32; typedef _Bool bool;
int nondet_int(void); unsigned int nondet_uint(void); unsigned char nondet_uchar(void);
#define ASSUME(x) __CPROVER_assume(x)
#define ASSERT(x,m) __CPROVER_assert((x),(m))
#define GUARD_GLOBAL_H
#define GUARD_HARDWARE_H
#define M2C_UNK s32
#define M2C_FIELD(expr, type_ptr, offset) (*(type_ptr)((s8 *)(expr) + (offset)))
#define AddAttr2dBitMap impl_AddAttr2dBitMap
#include "src/nonmatching/sub_8001570.c"
#undef AddAttr2dBitMap
#define AddAttr2dBitMap ref_AddAttr2dBitMap
#include "build/cbmc_8001570/ref_byteptr.c"
#undef AddAttr2dBitMap
static u16 dst_i[2048], dst_r[2048], src_i[2048], src_r[2048];
int main(void) {
    unsigned k;
    s16 ix = 0;
    s16 iy = 0;
    u16 chr = nondet_uint();
    u16 old = nondet_uint();
    u16 pix = nondet_uint();
    ASSUME(ix >= 0); ASSUME(ix < 32); ASSUME(iy >= 0); ASSUME(iy < 32);
    k = ((unsigned)iy) * 32u + (unsigned)ix;
    dst_i[512 + k] = dst_r[512 + k] = old;
    src_i[512] = src_r[512] = 0; /* width=height=1 */
    src_i[513] = src_r[513] = pix;
    impl_AddAttr2dBitMap(dst_i + 512, src_i + 512, ix, iy, chr);
    ref_AddAttr2dBitMap((u8 *)(dst_r + 512), src_r + 512, ix, iy, chr);
    ASSERT(dst_i[512 + k] == dst_r[512 + k], "sub_8001570 arbitrary dst word");
    return 0;
}
