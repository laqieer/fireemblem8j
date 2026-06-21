#include "global.h"
#include "proc.h"

extern u8 data_085FF538[];
void sub_805DF40(void *p) { (*(int *)0x0201774C)++; { void *q = Proc_Start((const struct ProcCmd *)data_085FF538, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; } *(int *)((char *)q + 0x48) = 0x080E1A4A; *(int *)((char *)q + 0x4c) = 0x0860A374; } }
