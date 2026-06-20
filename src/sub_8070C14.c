#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
void SetDefaultColorEffects_(void); void SetUnitEfxDebuff(struct Anim *, int);
void sub_8070C14(void *proc) {
    struct Anim *anim2 = GetAnimAnotherSide(*(struct Anim **)((char *)proc + 0x5c));
    int r = EfxAdvanceFrameLut((s16 *)((char *)proc + 0x2c), (s16 *)((char *)proc + 0x44), (const s16 *)*(int *)((char *)proc + 0x48));
    if (r >= 0) {
        int *t4c = *(int **)((char *)proc + 0x4c); int *t50 = *(int **)((char *)proc + 0x50);
        int *t54 = *(int **)((char *)proc + 0x54); int *t58 = *(int **)((char *)proc + 0x58);
        SpellFx_WriteBgMap(anim2, (const u16 *)t4c[r], (const u16 *)t50[r]);
        SpellFx_RegisterBgGfx((const u16 *)t54[r], 0x2000);
        SpellFx_RegisterBgPal((const u16 *)t58[r], 0x20);
    } else if (r == -1) {
        if (*(s16 *)((char *)proc + 0x3a) == 1) SetUnitEfxDebuff(anim2, 0xc);
        SpellFx_ClearBG1(); SetDefaultColorEffects_(); Proc_Break(proc);
    }
}
