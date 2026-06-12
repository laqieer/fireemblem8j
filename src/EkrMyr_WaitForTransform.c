#include "global.h"
#include "gbafe.h"

void EkrMyr_WaitForTransform(struct ProcEkrDragon *proc)
{
    struct Anim *anim = proc->anim;

    if (++proc->timer == 0x1A) {
        EfxPlaySE(SONG_DC, 0x100);
        M4aPlayWithPostionCtrl(SONG_DC, anim->xPosition, 1);
    }

    if (ANINS_GET_TYPE(*anim->pScrCurrent) == ANIM_INS_TYPE_STOP) {
        EfxPlaySE(SONG_DE, 0x100);
        M4aPlayWithPostionCtrl(SONG_DE, anim->xPosition, 1);
        EkrPrepareBanimfx(anim, BANIM_INDEX_MYRRH_MAIN - 1);
        Proc_Break(proc);
    }
}
