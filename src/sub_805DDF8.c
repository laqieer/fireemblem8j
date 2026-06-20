#include "global.h"
#include "proc.h"
void SpellFx_ClearBG1(void); void SetDefaultColorEffects_(void);
void sub_805DDF8(void *p) { u16 *tp = (u16 *)((char *)p + 0x2c); s16 t = (*tp += 1); if (t == *(s16 *)((char *)p + 0x2e)) { SpellFx_ClearBG1(); (*(int *)0x0201774C)--; SetDefaultColorEffects_(); Proc_Break(p); } }
