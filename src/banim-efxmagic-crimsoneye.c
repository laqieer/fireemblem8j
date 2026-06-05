#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0806A664
int efxCrimsonEyeOBJ_GetAdjustedOffsetX(int a, int b)
{
    int var;

    int r6 = efxCrimsonEyeOBJ_GetOffsetX(b, 0x100);

    if (b == 0 || b == 45)
    {
        return r6;
    }

    if (b <= 21)
    {
        var = b;
    }
    else if (b <= 44)
    {
        var = 45 - b;
    }
    else if (b < 66)
    {

        var = b - 45;
    }
    else
    {
        var = 90 - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a >> 1, a, var, 22);

    if (b <= 44)
    {
        return r6 - a;
    }
    else
    {
        return r6 + a;
    }
}

//! FE8U = 0x0806A6C4
int efxCrimsonEyeOBJ_GetAdjustedOffsetY(int a, int b)
{
    int var = efxCrimsonEyeOBJ_GetOffsetY(b, 0x100);

    if (b > 45)
    {
        b = 90 - b;
    }

    a = Interpolate(INTERPOLATE_LINEAR, a, a >> 1, b, 45);

    return var - a;
}

//! FE8U = 0x0806A6FC
void efxCrimsonEyeOBJ_SetAffineScaleEx(int index, int b, int c)
{
    int hi;
    int lo;
    int denom;

    if (c > 45)
    {
        c = 90 - c;
    }

    hi = Interpolate(INTERPOLATE_LINEAR, 128, 32, b, 24);
    lo = Interpolate(INTERPOLATE_LINEAR, 256, 384, b, 24);

    denom = Interpolate(INTERPOLATE_LINEAR, lo, hi, c, 45);

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
