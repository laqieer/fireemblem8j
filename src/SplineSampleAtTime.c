#include "global.h"

struct SplineCtrlPoint
{
    /* 0x0 */ s16 x;
    /* 0x2 */ s16 y;
    /* 0x4 */ u16 time;
    /* 0x6 */ u16 unk6;
};

struct Vec2s16
{
    /* 0x0 */ s16 x;
    /* 0x2 */ s16 y;
};

struct CatmullRomPoint
{
    int x;
    int y;
};

extern void SplineEvalCatmullRom(
    struct CatmullRomPoint * pts, s32 * out, u16 * times, u32 t, s32 count);
extern int sub_80D6384(int m, int v);

/*
 * JP-only spline driver matched by decomp.me fork 0O7nM from the Sp10a
 * family.
 */
int SplineSampleAtTime(
    struct SplineCtrlPoint * pts, int count, u32 t, struct Vec2s16 * out, u8 loop)
{
    struct CatmullRomPoint sp4[3];
    u16 sp1C[3];
    s32 sp24[2];
    s32 temp_r2;
    s32 var_sb;
    u32 temp_r3;
    int temp_r1;
    int i;
    int j;

    if (loop != 0)
    {
        t = sub_80D6384(pts[count - 1].time << 0xC, t);
        temp_r3 = t >> 0xC;
        var_sb = 0;
        temp_r2 = count - 2;

        while ((var_sb < temp_r2) &&
               ((temp_r3 < pts[var_sb + 0].time) || (temp_r3 >= pts[var_sb + 1].time)))
        {
            var_sb++;
        }

        if (var_sb == 0)
        {
            temp_r1 = pts[count - 1].time - pts[count - 2].time;
            sp4[0].x = pts[temp_r2].x;
            sp4[0].y = pts[temp_r2].y;
            sp1C[0] = var_sb;
            i = 1;
            j = 0;

            while (i < 3)
            {
                sp4[i].x = pts[j].x;
                sp4[i].y = pts[j].y;
                sp1C[i] = pts[j].time + temp_r1;

                if (j < count - 1)
                    j++;

                i++;
            }

            t += temp_r1 << 0xC;
        }
        else
        {
            i = 0;
            j = var_sb - 1;

            while (i < 3)
            {
                sp4[i].x = pts[j].x;
                sp4[i].y = pts[j].y;
                sp1C[i] = pts[j].time;
                j++;
                i++;
            }
        }
    }
    else
    {
        temp_r3 = t >> 0xC;
        var_sb = 0;

        while ((var_sb < count - 1) &&
               ((temp_r3 < pts[var_sb + 0].time) || (temp_r3 >= pts[var_sb + 1].time)))
        {
            var_sb++;
        }

        if (var_sb == 0)
        {
            i = 0;
            j = 0;

            while (i < 3)
            {
                sp4[i].x = pts[j].x;
                sp4[i].y = pts[j].y;
                sp1C[i] = pts[j].time;

                if (i < count - 1)
                    j++;

                i++;
            }
        }
        else
        {
            i = 0;
            j = var_sb - 1;

            while (i < 3)
            {
                sp4[i].x = pts[j].x;
                sp4[i].y = pts[j].y;
                sp1C[i] = pts[j].time;

                if (j < count - 1)
                    j++;

                i++;
            }
        }
    }

    SplineEvalCatmullRom(sp4, sp24, sp1C, t, 3);

    out->x = sp24[0];
    out->y = sp24[1];

    return var_sb;
}
