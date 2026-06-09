#include "gbafe.h"



/* prototypes for same-file helpers called by this run */
void EfxSelfThunderBGUpdateAnim(struct ProcSelfThunderBG *proc, u16 *img, u16 *tsa_close, u16 *tsa_far, u16 *pal);

void EfxSelfThunderBGOnInit(struct ProcSelfThunderBG *proc)
{
    proc->frame = 0;
    proc->timer = gEfxSelfThunderBGFrames[0].duration;
    EfxSelfThunderBGUpdateAnim(proc, gEfxSelfThunderBGFrames[0].img, gEfxSelfThunderBGFrames[0].tsa1, gEfxSelfThunderBGFrames[0].tsa2, gEfxSelfThunderBGFrames[0].pal);
}
