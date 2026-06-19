#include "global.h"
#include "spline.h"



extern u32  gSpline_0[3];
int Spline_FindSegment(s16 * arg_0, s16 arg_1, int * arg_2, int * arg_3);
void Spline_BuildCubicCoeffs(struct UnkSplineStruct1 * arg_0, struct UnkSplineStruct3 * arg_1, int arg_2);

int Spline_EvalIndirect(struct Struct02003BE8 * params, int mode, int * results)
{
    int i;
    struct UnkSplineStruct1 * sp_00[4];
    struct UnkSplineStruct1 sp_10[4];
    struct UnkSplineStruct3 sp_a0[4];
    struct UnkSplineStruct3 * r4;
    int r5;
    s16 * r8;
    s16 * r9;
    u32 ** sl;
    u32 sp_80;
    int sp_84;
    u32 sp_8c;
    u32 * sp_90;
    int sp_94;
    int sp_98;

    sp_8c = params->unk_00;
    r9 = params->unk_04;
    sp_90 = params->unk_08;
    r8 = params->unk_0C;
    sl = params->unk_10;

    sp_80 = mode;

    if (sp_80 == 0)
    {
        sp_94 = 0;
    }
    else
    {
        sp_94 = params->unk_02 - 1;
    }

    for (i = 0; i < 4; i++)
    {
        sp_00[i] = &sp_10[i];
    }

    if (params->unk_02 == 0)
    {
        return -1;
    }

    Spline_FindSegment(r9, params->unk_02, &sp_80, &sp_84);

    if (sp_84 == 0)
    {
        sp_98 = 1;
    }
    else if (sp_84 == params->unk_02 - 1)
    {
        sp_98 = 2;
    }
    else
    {
        sp_98 = 0;
    }

    for (i = 0; i < 4; i++)
    {
        sp_10[i].unk_00 = params->unk_00;

        if (sp_84 + i - 1 < 1)
        {
            sp_10[i].unk_02 = r9[0];
            sp_10[i].unk_04 = (void *)sp_90[0];

            if (sl[0] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[0];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gSpline_0;
            }
        }
        else if (sp_84 + i - 1 >= sp_94)
        {
            sp_10[i].unk_02 = r9[sp_94];
            sp_10[i].unk_04 = (void *)sp_90[sp_94];

            if (r8 != NULL && sl[r8[sp_94]] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[r8[sp_94]];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gSpline_0;
            }
        }
        else
        {
            sp_10[i].unk_02 = r9[sp_84 + i - 1];
            sp_10[i].unk_04 = (void *)sp_90[sp_84 + i - 1];

            if (r8 != NULL && sl[r8[sp_84 + i - 1]] != NULL)
            {
                sp_10[i].unk_08 = (s16 *)sl[r8[sp_84 + i - 1]];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)gSpline_0;
            }
        }
    }

    Spline_BuildCubicCoeffs(*sp_00, sp_a0, sp_98);

    if (params->unk_02 > sp_84 + 1)
    {
        r5 = DivArm(r9[sp_84 + 1] - r9[sp_84], sp_80 - r9[sp_84] * 0x1000);
    }
    else
    {
        r5 = sp_80 - r9[sp_84] * 0x1000;
    }

    r4 = sp_a0;
    for (i = 0; i < sp_8c; i++)
    {
        results[i] =
            DivArm(0x1000, r5 * (DivArm(0x1000, r5 * (DivArm(0x1000, r5 * r4->unk_00) + r4->unk_04)) + r4->unk_08)) +
            r4->unk_0c;
        r4++;
    }

    return sp_84;
}
