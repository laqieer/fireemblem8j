#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0806A560
int efxCrimsonEyeOBJ_WrapAngle(int a)
{
    while (a < 0)
    {
        a += 90;
    }

    while (a >= 90)
    {
        a -= 90;
    }

    return a;
}

//! FE8U = 0x0806A578
void efxCrimsonEyeOBJ_SetDrawPriority(struct Anim * anim, u32 b)
{
    if (b - 22 > 44)
    {
        anim->drawLayerPriority = 120;
    }
    else
    {
        anim->drawLayerPriority = 20;
    }

    return;
}
