#include "global.h"
#include "proc.h"
void SpellFx_ClearBG1Position(void);
void sub_80705C8(ProcPtr p) { ProcPtr q; SpellFx_ClearBG1Position(); q = Proc_Start((const struct ProcCmd *)0x08603968, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; *(u16 *)((char *)q + 0x2c) = 0; }
