#ifndef CBMC_SPIKE_COMMON_H
#define CBMC_SPIKE_COMMON_H

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

int nondet_int(void);
unsigned int nondet_uint(void);
unsigned char nondet_uchar(void);

#define ASSUME(x) __CPROVER_assume(x)
#define ASSERT(x, msg) __CPROVER_assert((x), msg)

#endif
