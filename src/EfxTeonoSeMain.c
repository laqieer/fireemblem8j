#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void EfxTeonoSeMain(struct ProcEfxMagicOBJ * proc)
{
    int sound_pos;

    if (++proc->timer == 0x8)
    {
        sound_pos = (u16)proc->anim2->xPosition + GetProperAnimSoundLocation(proc->anim2);
        {
            int sp = (s16)sound_pos;
            PlaySFX(0xCD, 0x100, sp, 1);
        }
        proc->timer = 0;
        if (proc->terminator <= 8)
            proc->terminator++;
    }
}
