#include "global.h"
#include "spline.h"


struct UnkSplineSub800AE7C
{
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ u16 unk_08;
    /* 0C */ s16 * unk_0c;
    /* 10 */ int * unk_10;
    /* 14 */ int * unk_14;
    /* 18 */ int * unk_18;
    /* 1C */ u16 unk_1c;
    /* 20 */ s16 * unk_20;
    /* 24 */ int * unk_24;
    /* 28 */ int * unk_28;
    /* 2C */ int * unk_2c;
    /* 30 */ u16 unk_30;
    /* 34 */ s16 * unk_34;
    /* 38 */ int * unk_38;
    /* 3C */ int * unk_3c;
    /* 40 */ int * unk_40;
};
struct Struct02003BE8_B
{
    /* 00 */ u16 unk_00;
    /* 02 */ u16 unk_02;
    /* 04 */ u16 * unk_04;
    /* 08 */ void * unk_08;
    /* 0C */ int * unk_0c;
    /* 10 */ int * unk_10;
};
struct InputStructA
{
    /* 00 */ s16 unk_00;
    /* 04 */ s16 * unk_04;
    /* 08 */ void * unk_08;
    /* 0C */ s16 * unk_0c;
    /* 10 */ void * unk_10;
};
struct InputStructB
{
    /* 00 */ int unk_00;
    /* 04 */ s16 * unk_04;
    /* 08 */ void ** unk_08;
    /* 0C */ int unk_0c;
    /* 10 */ void ** unk_10;
};
struct astruct_13
{
    /* 00 */ int unk_00;
    /* 04 */ struct InputStructB * unk_04;
    /* 08 */ struct InputStructB * unk_08;
    /* 0C */ int unk_0c;
    /* 10 */ int * unk_10;
    /* 14 */ int * unk_14;
};
struct astruct_12
{
    /* 00 */ int unk_00;
    /* 04 */ int unk_04;
    /* 08 */ struct InputStructA unk_08;
    /* 1C */ struct InputStructA unk_1c;
};
struct astruct_16
{
    int unk_00;
    struct Struct02003BE8 * unk_04;
    struct Struct02003BE8 * unk_08;
    int unk_0c;
    int * unk_10;
    int * unk_14;
};
extern u32  gSpline_0[3];
int Spline_FindSegment(s16 * arg_0, s16 arg_1, int * arg_2, int * arg_3);
void Spline_BuildCubicCoeffs(struct UnkSplineStruct1 * arg_0, struct UnkSplineStruct3 * arg_1, int arg_2);

int Spline_Eval(struct Struct02003BE8 * params, int mode, int * results)
{
    int i;
    struct UnkSplineStruct1 * sp_00[4];
    struct UnkSplineStruct1 sp_10[4];
    struct UnkSplineStruct3 sp_a0[4];
    struct UnkSplineStruct3 * r4;
    u32 * r4_;
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

    if (params->unk_10 == NULL)
    {
        r4_ = gSpline_0;
    }
    else
    {
        r4_ = (u32 *)params->unk_10;
    }

    for (i = 0; i < 4; i++)
    {
        sp_10[i].unk_00 = params->unk_00;

        if (sp_84 + i - 1 < 1)
        {
            sp_10[i].unk_02 = r9[0];
            sp_10[i].unk_04 = sp_90;
            sp_10[i].unk_08 = (s16 *)r4_;
        }
        else if (sp_84 + i - 1 >= sp_94)
        {
            sp_10[i].unk_02 = r9[sp_94];
            sp_10[i].unk_04 = &sp_90[sp_94 * sp_8c];

            if (r8 != NULL)
            {
                sp_10[i].unk_08 = (s16 *)&r4_[r8[sp_94] * 3];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)r4_;
            }
        }
        else
        {
            sp_10[i].unk_02 = r9[sp_84 + i - 1];
            sp_10[i].unk_04 = &sp_90[(sp_84 + i - 1) * sp_8c];

            if (r8 != NULL)
            {
                sp_10[i].unk_08 = (s16 *)&r4_[r8[(sp_84 + i - 1)] * 3];
            }
            else
            {
                sp_10[i].unk_08 = (s16 *)r4_;
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
