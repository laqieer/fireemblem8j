#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
void sub_8065C54(void *proc) {
    int r = EfxAdvanceFrameLut((s16 *)((char *)proc + 0x2c), (s16 *)((char *)proc + 0x44), (const s16 *)*(int *)((char *)proc + 0x48));
    if (r >= 0) { int base = *(int *)((char *)proc + 0x4c); SpellFx_RegisterBgPal((const u16 *)(base + (r << 5)), 0x20); }
    else if (r == -1) { (*(int *)0x0201774C)--; Proc_Break(proc); }
}
