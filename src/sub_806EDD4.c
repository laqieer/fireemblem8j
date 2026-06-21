#include "global.h"
#include "proc.h"

extern u8 data_0860349C[];
void sub_806EDD4(void *p) { void *q = Proc_Start((const struct ProcCmd *)data_0860349C, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; } *(int *)((char *)q + 0x48) = 0x080E4566; *(int *)((char *)q + 0x4c) = 0x085FAA50; }
