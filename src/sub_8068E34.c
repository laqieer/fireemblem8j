#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
void SetDefaultColorEffects_(void);
void sub_8068E34(void *proc) {
    int r = EfxAdvanceFrameLut((s16 *)((char *)proc + 0x2c), (s16 *)((char *)proc + 0x44), (const s16 *)*(int *)((char *)proc + 0x48));
    BG_SetPosition(1, 0, 0);
    if (r >= 0) {
        int *t4c = *(int **)((char *)proc + 0x4c); int *t50 = *(int **)((char *)proc + 0x50);
        int *t54 = *(int **)((char *)proc + 0x54); int *t58 = *(int **)((char *)proc + 0x58);
        void *p5c = *(void **)((char *)proc + 0x5c);
        SpellFx_WriteBgMap(p5c, (const u16 *)t4c[r], (const u16 *)t50[r]);
        SpellFx_RegisterBgGfx((const u16 *)t54[r], 0x2000);
        SpellFx_RegisterBgPal((const u16 *)t58[r], 0x20);
    } else if (r == -1) {
        SpellFx_ClearBG1(); (*(int *)0x0201774C)--; SetDefaultColorEffects_(); Proc_Break(proc);
    }
}
