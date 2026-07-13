#include "global.h"
#include "proc.h"

extern u8 data_085FF538[];
extern u8 data_0860A374[];
extern u8 frontier_df4_misc_lo_007_0E1870[];
void sub_805DF40(void *p) { (*(int *)0x0201774C)++; { void *q = Proc_Start((const struct ProcCmd *)data_085FF538, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; } *(int *)((char *)q + 0x48) = (int)(frontier_df4_misc_lo_007_0E1870 + 0x1DA); *(int *)((char *)q + 0x4c) = (int)data_0860A374; } }
