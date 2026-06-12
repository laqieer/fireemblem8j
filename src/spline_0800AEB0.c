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

//! FE8U = 0x0800AB58
void Spline_QuaternionToMatrix4x4(struct UnkSplineStruct3 * arg_0, int * arg_1)
{
    int r4;
    int r5;
    int r7;
    int r8;

    int pa;
    int pb;
    int pc;
    int pd;

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

    pa = arg_0->unk_00;
    pb = arg_0->unk_04;
    pc = arg_0->unk_08;
    pd = arg_0->unk_0c;

    r4 = DivArm(
        DivArm(0x1000, pa * pa) + DivArm(0x1000, pb * pb) + DivArm(0x1000, pc * pc) + DivArm(0x1000, pd * pd),
        0x2000000);

    r8 = DivArm(0x1000, pa * r4);
    r5 = DivArm(0x1000, pb * r4);
    r7 = DivArm(0x1000, pc * r4);

    var_1 = DivArm(0x1000, pd * r8);
    var_2 = DivArm(0x1000, pd * r5);
    var_3 = DivArm(0x1000, pd * r7);

    var_5 = DivArm(0x1000, pa * r8);
    var_7 = DivArm(0x1000, pa * r5);
    var_8 = DivArm(0x1000, pa * r7);

    var_6 = DivArm(0x1000, pb * r5);
    var_9 = DivArm(0x1000, pb * r7);
    var_4 = DivArm(0x1000, pc * r7);

    arg_1[0] = 0x1000 - (var_6 + var_4);
    arg_1[1] = var_7 + var_3;
    arg_1[2] = var_8 - var_2;

    arg_1[4] = var_7 - var_3;
    arg_1[5] = 0x1000 - (var_4 + var_5);
    arg_1[6] = var_9 + var_1;

    arg_1[8] = var_8 + var_2;
    arg_1[9] = var_9 - var_1;
    arg_1[10] = 0x1000 - (var_5 + var_6);

    arg_1[14] = 0;
    arg_1[13] = 0;
    arg_1[12] = 0;

    arg_1[11] = 0;
    arg_1[7] = 0;
    arg_1[3] = 0;

    arg_1[15] = 0x1000;

    return;
}
