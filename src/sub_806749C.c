#include "global.h"
#include "proc.h"
#include "anime.h"
#include "efxmagic.h"
#include "efxbattle.h"
#include "ekrbattle.h"

extern u32 gEfxBgSemaphore;
extern const u32 gUnk_08601A60[];

void sub_8067514(struct Anim *, int, int, int, int);

void sub_806749C(struct ProcEfxOBJ * proc)
{
    s16 idx;
    int a, b, c, d;

    if (++proc->timer > proc->unk44)
    {
        proc->timer = 0;
        idx = proc->terminator;
        a = gUnk_08601A60[idx * 4 + 0];
        b = gUnk_08601A60[idx * 4 + 1];
        c = gUnk_08601A60[idx * 4 + 2];
        d = gUnk_08601A60[idx * 4 + 3];
        sub_8067514(proc->anim2, a, b, c, d);
        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }
}
