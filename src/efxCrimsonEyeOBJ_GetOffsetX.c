#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern s8 gEfxmagicCrimsoneye_1[];

// clang-format on

//! FE8U = 0x0806A634
int efxCrimsonEyeOBJ_GetOffsetX(int index, int b)
{
    return (gEfxmagicCrimsoneye_1[index * 2] * b) >> 8;
}
