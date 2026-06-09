#include "global.h"
#include "hardware.h"
#include "bmlib.h"

void VecCrossVec(int const * lvec, int const * rvec, int * ovec)
{
    ovec[0] = (lvec[1] * rvec[2] - lvec[2] * rvec[1]) >> 12;
    ovec[1] = (lvec[2] * rvec[0] - lvec[0] * rvec[2]) >> 12;
    ovec[2] = (lvec[0] * rvec[1] - lvec[1] * rvec[0]) >> 12;
}

int Vec2CrossVec2(int arg_0, int arg_1, int arg_2, int arg_3)
{
    return arg_3 * arg_0 - arg_2 * arg_1;
}
