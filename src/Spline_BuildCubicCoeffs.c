#include "global.h"
#include "spline.h"

void Spline_PrepareSegmentControls(struct UnkSplineStruct1 * src, struct UnkSplineStruct2 * dest);
void Spline_ComputeRightTangents(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2);
void Spline_ComputeLeftTangents(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2);


//! FE8U = 0x0800A7D8
void Spline_BuildCubicCoeffs(struct UnkSplineStruct1 * arg_0, struct UnkSplineStruct3 * arg_1, int arg_2)
{
    int * r8;
    int * r9;
    int sp_44;
    int * sp_48;
    int * sp_4c;
    int i;
    int * sl;
    int * r9_;
    struct UnkSplineStruct2 unk;
    int arrayA[4];
    int arrayB[4];

    sp_44 = arg_0->unk_00;

    r8 = arg_0[1].unk_04;
    r9 = arg_0[2].unk_04;

    Spline_PrepareSegmentControls(arg_0 + 0, &unk);
    Spline_ComputeLeftTangents(&unk, arrayB, arg_2);

    Spline_PrepareSegmentControls(arg_0 + 1, &unk);
    Spline_ComputeRightTangents(&unk, arrayA, arg_2);

    sl = r8;
    r9_ = r9;
    sp_48 = arrayB;
    sp_4c = arrayA;

    for (i = 0; i < sp_44; i++)
    {
        arg_1->unk_00 = (DivArm(0x1000, *sl << 0xd) - DivArm(0x1000, *r9_ << 0xd)) + *sp_48 + *sp_4c;
        arg_1->unk_04 =
            ((DivArm(0x1000, *sl * -0x3000) + DivArm(0x1000, *r9_ * 0x3000)) - DivArm(0x1000, *sp_48 << 0xd)) - *sp_4c;
        arg_1->unk_08 = *sp_48;
        arg_1->unk_0c = *sl;

        sp_48++;
        sp_4c++;
        sl++;
        r9_++;
        arg_1++;
    }

    return;
}
