#include "global.h"

#include "worldmap.h"

struct Unk800C224Sub
{
    /* 00 */ STRUCT_PAD(0x00, 0x04);
    /* 04 */ s16 unk_04;
    /* 06 */ s16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ s16 unk_0a;
    /* 0C */ s16 unk_0c;
};

struct Unk800C224Proc
{
    /* 00 */ STRUCT_PAD(0x00, 0x38);
    /* 38 */ struct Unk800C224Sub * unk_38;
    /* 3C */ u16 unk_3c;
};

void GetWMCenteredCameraPosition(s16 x, s16 y, s16 * outX, s16 * outY);

int sub_800C224(struct Unk800C224Proc * proc)
{
    struct Unk800C224Sub * sub;
    const struct GMapNodeData * node;
    u16 index;
    s16 a;
    s16 b;
    s16 e;
    s16 f;
    s16 outX;
    s16 outY;

    sub = proc->unk_38;
    a = sub->unk_04;
    b = sub->unk_06;
    index = sub->unk_08;
    e = sub->unk_0a;
    f = sub->unk_0c;
    node = &gWMNodeData[index];

    GetWMCenteredCameraPosition(node->x, node->y, &outX, &outY);

    if ((((proc->unk_3c >> 2) & 1) != 0) || (e == 0 && f == 0))
    {
        gGMData.xCamera = outX;
        gGMData.yCamera = outY;
        return 0;
    }

    StartGmScroll(a, b, outX, outY, e, f);
    return 2;
}
