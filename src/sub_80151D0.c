#include "global.h"
#include "hardware.h"

void sub_80151D0(int * out, s16 angle)
{
    int cos = COS(angle);
    int sin = SIN(angle);

    out[0] = cos;
    out[1] = 0;
    out[2] = -sin;
    out[3] = 0;
    out[4] = 0x1000;
    out[5] = 0;
    out[6] = sin;
    out[7] = 0;
    out[8] = cos;
}
