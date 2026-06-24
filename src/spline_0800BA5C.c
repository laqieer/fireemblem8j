#include "global.h"

#include "spline.h"

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

int Spline_SetupSegment3(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4);
int Spline_SetupSegment4(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4);

//! FE8U = 0x0800B764
int Spline_SetupChannels(struct astruct_12 * arg_0, struct astruct_13 * arg_1, s16 arg_2)
{
    int ret;
    int flags = arg_0->unk_00;

    struct InputStructB * ip = arg_1->unk_04;
    struct InputStructB * r8 = arg_1->unk_08;

    if ((flags & 4) != 0)
    {
        ip->unk_04[0] = 0;
        ret = Spline_SetupSegment3(&arg_0->unk_08, ip, arg_1->unk_10, arg_1->unk_00, arg_2);
    }

    if ((flags & 8) != 0)
    {
        r8->unk_04[0] = 0;
        ret = Spline_SetupSegment4(&arg_0->unk_1c, r8, arg_1->unk_14, arg_1->unk_00, arg_2);
    }

    return ret;
}
