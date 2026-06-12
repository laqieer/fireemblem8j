#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0806A590
void efxCrimsonEyeOBJ_SetAffineScale(int index, int denom, int c)
{
    if (c > 45)
    {
        c = 90 - c;
    }

    denom = (Interpolate(INTERPOLATE_LINEAR, 256, 128, c, 45) * denom) >> 8;

    if (denom < 2)
    {
        denom = 2;
    }

    // clang-format off
    SetObjAffine(
        index,
        Div(+COS(0) * 16, denom),
        Div(-SIN(0) * 16, denom),
        Div(+SIN(0) * 16, denom),
        Div(+COS(0) * 16, denom)
    );
    // clang-format on

    return;
}
