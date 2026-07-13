#ifndef CBMC_SPIKE_FINAL4_D3BC_COMMON_H
#define CBMC_SPIKE_FINAL4_D3BC_COMMON_H
/* Shared typedefs/macros for the sub_807D3BC (SelectSummonPos) contract
 * harness. Mirrors the conventions already established in
 * scripts/tools/thumb_equiv/cbmc_spike/adversarial/common.h and
 * .../full16/focused/sub_800A34C/harness.c so this target-local harness
 * reads the same way as the rest of the cbmc_spike family. */

typedef unsigned char u8;
typedef signed char s8;
typedef short s16;
typedef unsigned int u32;
typedef int s32;

int nondet_int(void);
unsigned int nondet_uint(void);
unsigned char nondet_uchar(void);

#define ASSUME(x) __CPROVER_assume(x)
#define ASSERT(x, msg) __CPROVER_assert((x), msg)

#endif
