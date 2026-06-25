#include "global.h"

extern int DivArm(int num, int den);

struct SplineVec2
{
    int x;
    int y;
};

void sub_800A194(int *a, int *b, int *c, struct SplineVec2 *d, int n)
{
    int i;

    b[0] = DivArm(a[0], b[0] << 12);

    for (i = 1; i < n - 1; i++)
    {
        a[i] -= DivArm(0x1000, b[i - 1] * c[i]);
        b[i] = DivArm(a[i], b[i] << 12);
    }

    a[n - 1] -= DivArm(0x1000, b[n - 2] * c[n - 1]);

    d[0].x = DivArm(a[0], d[0].x << 12);

    for (i = 1; i < n; i++)
    {
        int ai = a[i];
        d[i].x = DivArm(ai, (d[i].x - DivArm(0x1000, c[i] * d[i - 1].x)) << 12);
    }

    d[0].y = DivArm(a[0], d[0].y << 12);

    for (i = 1; i < n; i++)
    {
        int ai = a[i];
        d[i].y = DivArm(ai, (d[i].y - DivArm(0x1000, c[i] * d[i - 1].y)) << 12);
    }

    for (i = n - 2; i >= 0; i--)
        d[i].x -= DivArm(0x1000, d[i + 1].x * b[i]);

    for (i = n - 2; i >= 0; i--)
        d[i].y -= DivArm(0x1000, d[i + 1].y * b[i]);
}
