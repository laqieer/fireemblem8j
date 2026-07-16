#include "global.h"

struct SplineVec2
{
    int x;
    int y;
};

extern void sub_800A194(int * a, int * b, int * c, struct SplineVec2 * d, int n);

/* The ROM routes compiler-generated signed division calls to the BIOS wrapper. */
asm(".set __divsi3, DivArm");

typedef struct CatmullRomPoint
{
    int x;
    int y;
} CatmullRomPoint;

/*
 * JP-only Catmull-Rom evaluator matched by decomp.me fork fHkHP from the
 * ABtKz family.
 */
void SplineEvalCatmullRom(CatmullRomPoint * pts, s32 * out, u16 * times, u32 t, s32 count)
{
    s32 sp4[4];
    s32 sp14[4];
    s32 sp24[4];
    CatmullRomPoint sp34[4];
    s32 sp60;
    s32 var_r4;
    u32 temp_r0_3;
    u32 temp_r3;
    int t0;
    int t1;
    int t2;
    int t3;

    temp_r3 = t >> 0xC;
    sp60 = 0;

    while (sp60 < (count - 1) &&
           ((temp_r3 < times[sp60 + 0]) || (temp_r3 >= times[sp60 + 1])))
    {
        sp60++;
    }

    sp14[0] = 0x2000;
    sp24[0] = 0x1000;
    sp34[0].x = -((pts[0].x - pts[1].x) * 3);
    sp34[0].y = -((pts[0].y - pts[1].y) * 3);

    for (var_r4 = 1; var_r4 < count - 1; var_r4++)
    {
        sp4[var_r4] = 0x1000;
        sp14[var_r4] = 0x4000;
        sp24[var_r4] = 0x1000;
        sp34[var_r4].x = -((pts[var_r4 - 1].x - pts[var_r4 + 1].x) * 3);
        sp34[var_r4].y = -((pts[var_r4 - 1].y - pts[var_r4 + 1].y) * 3);
    }

    sp4[count - 1] = 0x1000;
    sp14[count - 1] = 0x2000;
    sp34[count - 1].x = -((pts[count - 2].x - pts[count - 1].x) * 3);
    sp34[count - 1].y = -((pts[count - 2].y - pts[count - 1].y) * 3);
    sub_800A194(
        (int *)&sp14, (int *)&sp24, (int *)&sp4, (struct SplineVec2 *)&sp34, count);

    if (sp60 < count - 1)
    {
        temp_r0_3 =
            (u32)(t - (times[sp60 + 0] << 0xC)) / (u32)(times[sp60 + 1] - times[sp60 + 0]);
        t0 = (((pts[sp60 + 0].x - pts[sp60 + 1].x) * 2) + sp34[sp60 + 0].x +
              sp34[sp60 + 1].x);
        t1 = (((pts[sp60 + 1].x - pts[sp60 + 0].x) * 3) - (sp34[sp60 + 0].x * 2)) -
             sp34[sp60 + 1].x;
        t2 = (((pts[sp60 + 0].y - pts[sp60 + 1].y) * 2) + sp34[sp60 + 0].y +
              sp34[sp60 + 1].y);
        t3 = (((pts[sp60 + 1].y - pts[sp60 + 0].y) * 3) - (sp34[sp60 + 0].y * 2)) -
             sp34[sp60 + 1].y;
        out[0] = 0x1000 /
                     (s32)((0x1000 /
                                (s32)((0x1000 / (s32)(t0 * temp_r0_3) + t1) *
                                      temp_r0_3) +
                            sp34[sp60 + 0].x) *
                           temp_r0_3) +
                 pts[sp60 + 0].x;
        out[1] = 0x1000 /
                     (s32)((0x1000 /
                                (s32)((0x1000 / (s32)(t2 * temp_r0_3) + t3) *
                                      temp_r0_3) +
                            sp34[sp60 + 0].y) *
                           temp_r0_3) +
                 pts[sp60 + 0].y;
    }
    else
    {
        out[0] = pts[count - 1].x;
        out[1] = pts[count - 1].y;
    }
}
