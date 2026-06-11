#include "global.h"
#include "spline.h"

//! FE8U = 0x0800A518
void Spline_ComputeRightTangents(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_08;
    int sp_0c;
    int sp_10;

    int sp_14 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r5 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_18 = arg_0->unk_08;
    int * sp_1c = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r4 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r7 = r1[2];

    if ((r2 == r5) || (r2 == r3))
    {
        sp_10 = 0;
    }
    else
    {
        sp_10 = DivArm(0x1000, DivArm(r2 - r3, (r5 - r3) * 0x1000) << 0xd);
    }

    r5 = (r7 > 0) ? r7 : -r7;

    sp_10 = (sp_10 + r5) - DivArm(0x1000, r5 * sp_10);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (0x1000 - r7)) * (r8 + 0x1000)) << 0xb);
    sp_0c = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (r7 + 0x1000)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_14; i++)
    {
        int a = sp_18[i] - sp_1c[i];
        int b = r9[i] - sp_18[i];

        *arg_1 = DivArm(0x1000, sp_10 * (DivArm(0x1000, sp_08 * a) + DivArm(0x1000, sp_0c * b)));

        if (arg_2 == 2)
        {
            *arg_1 = DivArm(0x1000, (sp_08 + sp_0c) * a);
        }
        arg_1++;
    }

    return;
}
