#include "global.h"
#include "hardware.h"

void sub_8015188(int * out, s16 angle)
{
    int cos = COS(angle);
    int sin = SIN(angle);

    out[0] = 0x1000;
    out[1] = 0;
    out[2] = 0;
    out[3] = 0;
    out[4] = cos;
    out[5] = -sin;
    out[6] = 0;
    out[7] = sin;
    out[8] = cos;
}
