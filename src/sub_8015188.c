#include "global.h"
#include "hardware.h"

struct Mtx
{
    int m[9];
};

void sub_8015188(struct Mtx * mtx, short angle)
{
    int c = COS(angle);
    int s = SIN(angle);

    mtx->m[0] = 0x1000;
    mtx->m[1] = 0;
    mtx->m[2] = 0;

    mtx->m[3] = 0;
    mtx->m[4] = c;
    mtx->m[5] = -s;

    mtx->m[6] = 0;
    mtx->m[7] = s;
    mtx->m[8] = c;
}

void sub_80151D0(struct Mtx * mtx, short angle)
{
    int c = COS(angle);
    int s = SIN(angle);

    mtx->m[0] = c;
    mtx->m[1] = 0;
    mtx->m[2] = -s;

    mtx->m[3] = 0;
    mtx->m[4] = 0x1000;
    mtx->m[5] = 0;

    mtx->m[6] = s;
    mtx->m[7] = 0;
    mtx->m[8] = c;
}

void sub_8015218(struct Mtx * mtx, short angle)
{
    int c = COS(angle);
    int s = SIN(angle);

    mtx->m[0] = c;
    mtx->m[1] = -s;
    mtx->m[2] = 0;

    mtx->m[3] = s;
    mtx->m[4] = c;
    mtx->m[5] = 0;

    mtx->m[6] = 0;
    mtx->m[7] = 0;
    mtx->m[8] = 0x1000;
}
