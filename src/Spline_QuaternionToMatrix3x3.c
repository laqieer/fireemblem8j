#include "global.h"
#include "spline.h"

//! FE8U = 0x0800ACEC
void Spline_QuaternionToMatrix3x3(struct UnkSplineStruct3 * arg_0, int * arg_1)
{
    int r4;
    int r5;
    int r7;
    int r8;

    int p_a;
    int p_b;
    int p_c;
    int p_d;

    int var_1;
    int var_2;
    int var_3;
    int var_4;
    int var_5;
    int var_6;
    int var_7;
    int var_8;
    int var_9;

    int sp_00;
    int sp_04;
    int sp_08;
    int sp_0c;

    p_a = arg_0->unk_00;
    p_b = arg_0->unk_04;
    p_c = arg_0->unk_08;
    p_d = arg_0->unk_0c;

    r4 = DivArm(
        DivArm(0x1000, p_a * p_a) + DivArm(0x1000, p_b * p_b) + DivArm(0x1000, p_c * p_c) + DivArm(0x1000, p_d * p_d),
        0x2000000);

    r8 = DivArm(0x1000, p_a * r4);
    r5 = DivArm(0x1000, p_b * r4);
    r7 = DivArm(0x1000, p_c * r4);

    var_1 = DivArm(0x1000, p_d * r8);
    var_2 = DivArm(0x1000, p_d * r5);
    var_3 = DivArm(0x1000, p_d * r7);

    var_5 = DivArm(0x1000, p_a * r8);
    var_7 = DivArm(0x1000, p_a * r5);
    var_8 = DivArm(0x1000, p_a * r7);

    var_6 = DivArm(0x1000, p_b * r5);
    var_9 = DivArm(0x1000, p_b * r7);
    var_4 = DivArm(0x1000, p_c * r7);

    arg_1[0] = 0x1000 - (var_6 + var_4);
    arg_1[1] = var_7 + var_3;
    arg_1[2] = var_8 - var_2;
    arg_1[3] = var_7 - var_3;
    arg_1[4] = 0x1000 - (var_4 + var_5);
    arg_1[5] = var_9 + var_1;
    arg_1[6] = var_8 + var_2;
    arg_1[7] = var_9 - var_1;
    arg_1[8] = 0x1000 - (var_5 + var_6);

    arg_1[11] = 0x1000;
    arg_1[10] = 0x1000;
    arg_1[9] = 0x1000;

    return;
}
