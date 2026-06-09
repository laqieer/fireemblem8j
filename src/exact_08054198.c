#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

// clang-format off



//! FE8U = 0x080534AC
void EfxFarAttack_SetAnimXPositions(struct ProcEfxFarAttack * unused, int x)
{
    struct Anim * anim = gAnims[0];
    x = -x;

    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[1];
    anim->xPosition = x + gEkrXPosReal[0];

    anim = gAnims[2];
    anim->xPosition = x + gEkrXPosReal[1];

    anim = gAnims[3];
    anim->xPosition = x + gEkrXPosReal[1];

    return;
}
