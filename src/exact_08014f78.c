#include "global.h"
#include "hardware.h"
#include "bmlib.h"

void VecMulMat(int const * vec, int const * mat, int * ovec)
{
    ovec[0] = ((vec[0] * mat[0]) + (vec[1] * mat[3]) + (vec[2] * mat[6])) >> 12;
    ovec[1] = ((vec[0] * mat[1]) + (vec[1] * mat[4]) + (vec[2] * mat[7])) >> 12;
    ovec[2] = ((vec[0] * mat[2]) + (vec[1] * mat[5]) + (vec[2] * mat[8])) >> 12;
}
