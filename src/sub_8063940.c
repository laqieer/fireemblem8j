#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
void SetDefaultColorEffects_(void);
void sub_8063940(void *proc) { int r = EfxAdvanceFrameLut((s16 *)((char *)proc + 0x2c), (s16 *)((char *)proc + 0x44), (const s16 *)*(int *)((char *)proc + 0x48)); if (r >= 0) {
        int *t4c = *(int **)((char *)proc + 0x4c); int *t50 = *(int **)((char *)proc + 0x50); void *p5c = *(void **)((char *)proc + 0x5c);
        SpellFx_WriteBgMap(p5c, (const u16 *)t4c[r], (const u16 *)t50[r]);
} else if (r == -1) {
        SpellFx_ClearBG1(); (*(int *)0x0201774C)--; SetDefaultColorEffects_(); Proc_Break(proc);
} }
