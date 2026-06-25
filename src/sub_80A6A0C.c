#include "global.h"

struct PackedField80A69F8
{
    /* 00 */ STRUCT_PAD(0x00, 0x04);
    /* 04 */ int field4;
    /* 08 */ int field8;
    /* 0C */ int fieldC;
};

void sub_80A6A0C(struct PackedField80A69F8* src, u8* dst)
{
    dst[0] = src->field8;
    dst[1] = src->field4;
    dst[2] = src->field4 >> 16;
}

int sub_80A6A1C(int* p)
{
    return p[3] = ((p[3] * 13) + 1) & 0xff;
}
