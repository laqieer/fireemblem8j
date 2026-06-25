#include "global.h"

struct PackedField80A69F8
{
    /* 00 */ STRUCT_PAD(0x00, 0x04);
    /* 04 */ int field4;
    /* 08 */ int field8;
    /* 0C */ int fieldC;
};

void sub_80A69F8(struct PackedField80A69F8* dst, u8* src)
{
    int v = src[0];

    dst->field8 = v;
    dst->field4 = src[1] + (src[2] << 8);
    dst->fieldC = v;
}
