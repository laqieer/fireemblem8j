#include "global.h"
#include "gbafe.h"

void EfxSelfThunderBGMain(struct ProcSelfThunderBG *proc)
{
    int frame;

    if (proc->timer == 0) {
        frame = ++proc->frame;

        if (((proc->timer = gEfxSelfThunderBGFrames[frame].duration) << 16) == 0xFFFF0000) {
            SpellFx_ClearBG1();
            SetDefaultColorEffects_();
            Proc_Break(proc);
            return;
        }

        EfxSelfThunderBGUpdateAnim(proc, gEfxSelfThunderBGFrames[frame].img, gEfxSelfThunderBGFrames[frame].tsa1, gEfxSelfThunderBGFrames[frame].tsa2, gEfxSelfThunderBGFrames[frame].pal);
    }

    proc->timer--;
}
