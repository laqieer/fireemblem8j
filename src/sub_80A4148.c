#include "global.h"
#include "ctc.h"

struct Unk80A4148Proc
{
    PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x30);
    /* 30 */ int unk30;
};

extern void sub_80989D4(int a, int b, int c, int d);

// JP-only small fixed sprite draw (worldmap/ending asset region).
void sub_80A4148(struct Unk80A4148Proc * proc)
{
    int i;
    int prio;
    int x;

    sub_80989D4(0x90, 3, proc->unk30, 0x8f << 6);

    prio = 0x9c << 5;
    x = 0x94;

    for (i = 2; i >= 0; i--)
    {
        PutSpriteExt(4, x, 0x12, gObject_32x16, prio);
        prio += 4;
        x += 0x20;
    }
}
