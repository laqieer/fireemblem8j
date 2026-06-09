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

/* prototypes for same-file helpers called by this run */
int Spline_Eval(struct Struct02003BE8 * params, int mode, int * results);

//! FE8U = 0x0800AE7C
int Spline_EvalTransformChannels(struct UnkSplineSub800AE7C * arg_0, int arg_1, int * arg_2, int * arg_3, int * arg_4)
{
    int ret;
    struct Struct02003BE8_B local;

    int flags = arg_0->unk_00;

    if ((flags & 4) != 0)
    {
        local.unk_02 = arg_0->unk_08;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_0c;
        local.unk_08 = arg_0->unk_10;
        local.unk_0c = arg_0->unk_14;
        local.unk_10 = arg_0->unk_18;

        ret = Spline_Eval((void *)&local, arg_1, arg_2);

        if (ret < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
        }
    }

    if ((flags & 8) != 0)
    {
        local.unk_02 = arg_0->unk_1c;
        local.unk_00 = 4;
        local.unk_04 = arg_0->unk_20;
        local.unk_08 = arg_0->unk_24;
        local.unk_0c = arg_0->unk_28;
        local.unk_10 = arg_0->unk_2c;

        ret = Spline_Eval((void *)&local, arg_1, arg_3);

        if (ret < 0)
        {
            arg_3[2] = 0;
            arg_3[1] = 0;
            arg_3[0] = 0;
            arg_3[3] = 1;
        }
    }

    if ((flags & 0x10) != 0)
    {
        local.unk_02 = arg_0->unk_30;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_34;
        local.unk_08 = arg_0->unk_38;
        local.unk_0c = arg_0->unk_3c;
        local.unk_10 = arg_0->unk_40;

        ret = Spline_Eval((void *)&local, arg_1, arg_4);

        if (ret < 0)
        {
            arg_4[2] = 0;
            arg_4[1] = 0;
            arg_4[0] = 0;
        }
    }

    return ret;
}
