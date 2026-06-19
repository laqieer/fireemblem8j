#include "global.h"
#include "proc.h"
ProcPtr sub_8070794(void *a, int b) { ProcPtr q = Proc_Start((const struct ProcCmd *)0x08603A00, (ProcPtr)3); *(void **)((char *)q + 0x5c) = a; *(u16 *)((char *)q + 0x2c) = 0; *(u16 *)((char *)q + 0x2e) = 0; *(int *)((char *)q + 0x44) = b; *(int *)((char *)q + 0x48) = 0x100; return q; }
