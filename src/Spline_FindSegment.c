#include "global.h"
#include "spline.h"

int Spline_FindSegment(s16 * arg_0, s16 arg_1, int * arg_2, int * arg_3)
{
    register int r2 asm("r2");
    int r3;
    register int n asm("r3") = arg_1;

    int r4 = arg_0[0] * 0x1000;

    if (*arg_2 < r4)
    {
        *arg_3 = 0;
        *arg_2 = r4;
        return -2;
    }

    r2 = arg_0[n - 1] * 0x1000;

    if (*arg_2 > r2)
    {
        register int last asm("r0") = n - 1;
        *arg_3 = last;
        *arg_2 = r2;
        return -2;
    }

    r3 = 0;

    while (1)
    {
        if (arg_0[r3] * 0x1000 <= *arg_2 && arg_0[r3 + 1] * 0x1000 >= *arg_2)
        {
            break;
        }

        r3++;
    }

    *arg_3 = r3;

    return 0;
}
