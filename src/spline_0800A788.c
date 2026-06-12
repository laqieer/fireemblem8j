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

//! FE8U = 0x0800A42C
int Spline_Ease(int val, int start, int end)
{
#if NONMATCHING
    int num1 = start + end;
#else
    register int num1 asm("r6") = start + end;
#endif

    if (num1 == 0)
        return val;

    if (num1 > 0x1000)
    {
        start = DivArm(num1, start * 0x1000);
        end = DivArm(num1, end * 0x1000);
    }

    num1 = DivArm(0x2000 - start - end, 0x1000000);

    if (val < start)
    {
        if (start == 0)
            start = 1;

        return DivArm(0x1000, DivArm(0x1000, DivArm(start, num1 * 0x1000) * val) * val);
    }

    if (val < (0x1000 - end))
    {
        return DivArm(0x1000, num1 * (DivArm(0x1000, val * 0x2000) - start));
    }

    val = 0x1000 - val;
    if (end == 0)
        end = 1;

    return 0x1000 - DivArm(0x1000, DivArm(0x1000, DivArm(end, num1 * 0x1000) * val) * val);
}
