#include "global.h"
#include "hardware.h"
#include "bmlib.h"

void MatMulMat(int const * lmat, int const * rmat, int * omat)
{
    int tmpmat[12];
    int * mat;

    if (lmat == omat || rmat == omat)
        mat = tmpmat;
    else
        mat = omat;

    mat[0] = ((lmat[0] * rmat[0]) + (lmat[1] * rmat[3]) + (lmat[2] * rmat[6])) >> 12;
    mat[1] = ((lmat[0] * rmat[1]) + (lmat[1] * rmat[4]) + (lmat[2] * rmat[7])) >> 12;
    mat[2] = ((lmat[0] * rmat[2]) + (lmat[1] * rmat[5]) + (lmat[2] * rmat[8])) >> 12;

    mat[3] = ((lmat[3] * rmat[0]) + (lmat[4] * rmat[3]) + (lmat[5] * rmat[6])) >> 12;
    mat[4] = ((lmat[3] * rmat[1]) + (lmat[4] * rmat[4]) + (lmat[5] * rmat[7])) >> 12;
    mat[5] = ((lmat[3] * rmat[2]) + (lmat[4] * rmat[5]) + (lmat[5] * rmat[8])) >> 12;

    mat[6] = ((lmat[6] * rmat[0]) + (lmat[7] * rmat[3]) + (lmat[8] * rmat[6])) >> 12;
    mat[7] = ((lmat[6] * rmat[1]) + (lmat[7] * rmat[4]) + (lmat[8] * rmat[7])) >> 12;
    mat[8] = ((lmat[6] * rmat[2]) + (lmat[7] * rmat[5]) + (lmat[8] * rmat[8])) >> 12;

    mat[9]  = (((lmat[0] * rmat[9]) + (lmat[3] * rmat[10]) + (lmat[6] * rmat[11])) >> 12) + lmat[9];
    mat[10] = (((lmat[1] * rmat[9]) + (lmat[4] * rmat[10]) + (lmat[7] * rmat[11])) >> 12) + lmat[10];
    mat[11] = (((lmat[2] * rmat[9]) + (lmat[5] * rmat[10]) + (lmat[8] * rmat[11])) >> 12) + lmat[11];

    if (mat == tmpmat)
        MatCopy(tmpmat, omat);
}

void MatIdent(int * mat)
{
    mat[0] = 1 << 12;
    mat[1] = 0;
    mat[2] = 0;

    mat[3] = 0;
    mat[4] = 1 << 12;
    mat[5] = 0;

    mat[6] = 0;
    mat[7] = 0;
    mat[8] = 1 << 12;

    mat[9]  = 0;
    mat[10] = 0;
    mat[11] = 0;
}
