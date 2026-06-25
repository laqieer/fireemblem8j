#include "global.h"
#include "hardware.h"

void sub_8015218(int * out, s16 angle)
{
    int cos = COS(angle);
    int sin = SIN(angle);

    out[0] = cos;
    out[1] = -sin;
    out[2] = 0;
    out[3] = sin;
    out[4] = cos;
    out[5] = 0;
    out[6] = 0;
    out[7] = 0;
    out[8] = 0x1000;
}
