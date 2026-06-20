#include "global.h"
#include "proc.h"
void sub_807083C(void *p, void *a1, void *a2, void *a3, void *a4) { void *q = Proc_Start((const struct ProcCmd *)0x08603A18, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; *(u16 *)((char *)q + 0x2c) = 0; *(void **)((char *)q + 0x44) = a2; *(void **)((char *)q + 0x48) = a3; *(void **)((char *)q + 0x4c) = a4; *(void **)((char *)q + 0x64) = a1; }
