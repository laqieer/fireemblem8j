#include "global.h"
#include "proc.h"
#include "efxbattle.h"

extern u8 data_0860349C[];
extern u8 frontier_df4_misc_lo_010c_0E3F3C[];
void sub_806EDD4(void *p) { void *q = Proc_Start((const struct ProcCmd *)data_0860349C, (ProcPtr)3); *(void **)((char *)q + 0x5c) = p; { int z = 0; *(u16 *)((char *)q + 0x2c) = z; *(int *)((char *)q + 0x44) = z; } *(int *)((char *)q + 0x48) = (int)(frontier_df4_misc_lo_010c_0E3F3C + 0x62A); *(int *)((char *)q + 0x4c) = (int)Pal_EfxPierceCriticalEffectBG; }
