#include "global.h"

#include "spline.h"

/* file-scope type definitions used by this run */


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

//! FE8U = 0x0800A680
void Spline_ComputeLeftTangents(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_04;
    int sp_08;
    int sp_0c;

    int sp_10 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r4 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_14 = arg_0->unk_08;
    int * sp_18 = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r7 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r6 = r1[2];

    if ((r2 == r4) || (r2 == r3))
    {
        sp_0c = 0;
    }
    else
    {
        sp_0c = DivArm(0x1000, DivArm(r2 - r3, (r2 - r4) * 0x1000) << 0xd);
    }

    r4 = (r6 > 0) ? r6 : -r6;

    sp_0c = (sp_0c + r4) - DivArm(0x1000, r4 * sp_0c);
    sp_04 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (r6 + 0x1000)) * (r8 + 0x1000)) << 0xb);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (0x1000 - r6)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_10; i++)
    {
        int a = sp_14[i] - sp_18[i];
        int b = r9[i] - sp_14[i];

        *arg_1 = DivArm(0x1000, sp_0c * (DivArm(0x1000, sp_04 * a) + DivArm(0x1000, sp_08 * b)));

        if (arg_2 == 1)
        {
            *arg_1 = DivArm(0x1000, (sp_04 + sp_08) * b);
        }

        arg_1++;
    }

    return;
}
