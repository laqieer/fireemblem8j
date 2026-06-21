#include "global.h"
#include "proc.h"

extern u8 data_08603968[];
void SpellFx_ClearBG1Position(void);
void sub_80705C8(ProcPtr p) { ProcPtr q; SpellFx_ClearBG1Position(); q = Proc_Start((const struct ProcCmd *)data_08603968, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; *(u16 *)((char *)q + 0x2c) = 0; }
