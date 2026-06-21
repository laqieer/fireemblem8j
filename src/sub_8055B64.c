#include "global.h"
#include "proc.h"

extern u8 data_085E3C3C[];
void sub_8055B64(int a, int b) { int aa = (s16)a, bb = (s16)b; void *q = Proc_Start((const struct ProcCmd *)data_085E3C3C, (ProcPtr)3); int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; *(int *)((char *)q + 0x48) = 0x080DFCF6; *(int *)((char *)q + 0x4c) = z; *(int *)((char *)q + 0x50) = z; *(int *)((char *)q + 0x54) = aa; *(int *)((char *)q + 0x58) = bb; *(void **)0x02017774 = q; }
