#include "global.h"
#include "hardware.h"
#include "bmlib.h"

int VecDotVec(int const * lvec, int const * rvec)
{
    return ((lvec[0] * rvec[0]) + (lvec[1] * rvec[1]) + (lvec[2] * rvec[2])) >> 12;
}
