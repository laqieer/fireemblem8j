#include "gbafe.h"



/* prototypes for same-file helpers called by this run */
void EfxSelfThunderBGUpdateAnimTSA(struct Anim *anim, const u16 *tsa_close, const u16 *tsa_far);

void EfxSelfThunderBGUpdateAnim(struct ProcSelfThunderBG *proc, u16 *img, u16 *tsa_close, u16 *tsa_far, u16 *pal)
{
    SpellFx_RegisterBgGfx(img, 0x0C00);
    SpellFx_RegisterBgPal(pal, 0x20);
    EfxSelfThunderBGUpdateAnimTSA(proc->anim, tsa_close, tsa_far);
}
