#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern s8 gEfxmagicCrimsoneye_1[];

//! FE8U = 0x0806A64C
int efxCrimsonEyeOBJ_GetOffsetY(int index, int b)
{
    return (gEfxmagicCrimsoneye_1[index * 2 + 1] * b) >> 10;
}
