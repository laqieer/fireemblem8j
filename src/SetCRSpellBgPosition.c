#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"

void SetCRSpellBgPosition(struct Anim * anim, struct AnimMagicFxBuffer * magicFx)
{
    int x;
    int y;

    if (GetAnimPosition(anim) == 0)
    {
        x = (s16)(anim->xPosition - BanimTypesPosLeft[0]);
    }
    else
    {
        x = (s16)(BanimTypesPosRight[0] - anim->xPosition);
    }

    y = (s16)(88 - anim->yPosition);

    BG_SetPosition(magicFx->bg, x - magicFx->xOffsetBg, y - magicFx->yOffsetBg);

    return;
}
