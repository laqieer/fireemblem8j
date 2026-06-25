#include "global.h"
#include "fontgrp.h"

struct Unk8048F24Entry
{
    /* 00 */ u16 msgid;
    /* 02 */ u16 unk02;
};

extern struct Unk8048F24Entry gUnk_085D3ECC[];

void sub_8048DC0(struct Text * text, int a, int b, int c);

void sub_8048F24(struct Text * text, int colorId, int index)
{
    struct Unk8048F24Entry * base = gUnk_085D3ECC;
    struct Unk8048F24Entry * entry = base + index;
    int unk02 = entry->unk02;
    int x;

    sub_8048DC0(text, unk02, 1, colorId);

    x = (0x46 - GetStringTextLen(GetStringFromIndex(entry->msgid))) / 2;

    if (unk02 == 0)
        x -= 0x20;

    Text_InsertDrawString(text, x + 0x28, colorId, GetStringFromIndex(entry->msgid));
}
