#include "global.h"

#include "spline.h"

/* file-scope type definitions used by this run */

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

int Spline_FindSegment(s16 *, s16, int *, int *);

//! FE8U = 0x0800B198
int Spline_SetupSegment3(struct InputStructA * arg_0, struct InputStructB * arg_1, int * arg_2, int arg_3, s16 arg_4)
{
    s16 * r8;
    struct Struct02003BE8_B local;
    int r9;
    int sp_18;

    Spline_FindSegment(r8 = arg_0->unk_04, r9 = arg_0->unk_00, &arg_3, &sp_18);

    arg_1->unk_04[1] = arg_4;

    if ((sp_18 < r9 - 1) && (r8[sp_18 + 1] == (s16)DivArm(0x1000, arg_3)))
    {
        arg_1->unk_08[1] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];

        if (sp_18 < r9 - 2)
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 2]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 6;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 2] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }
    }
    else
    {
        local.unk_02 = arg_0->unk_00;
        local.unk_00 = 3;
        local.unk_04 = arg_0->unk_04;
        local.unk_08 = (void *)arg_0->unk_08;
        local.unk_0c = (void *)arg_0->unk_0c;
        local.unk_10 = (void *)arg_0->unk_10;

        if (Spline_Eval((void *)&local, arg_3, arg_2) < 0)
        {
            arg_2[2] = 0;
            arg_2[1] = 0;
            arg_2[0] = 0;
        }

        arg_1->unk_08[1] = arg_2;
        arg_1->unk_10[1] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];

        if (sp_18 >= r9 - 1)
        {
            arg_1->unk_04[2] = arg_4 + 1;
            arg_1->unk_08[2] = arg_2;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18] * 3];
        }
        else
        {
            arg_1->unk_04[2] = (arg_4 + arg_0->unk_04[sp_18 + 1]) - DivArm(0x1000, arg_3);
            arg_1->unk_08[2] = &((int *)(arg_0->unk_08))[sp_18 * 3] + 3;
            arg_1->unk_10[2] = &((int *)(arg_0->unk_10))[arg_0->unk_0c[sp_18 + 1] * 3];
        }

        return 1;
    }

    return 0;
}
