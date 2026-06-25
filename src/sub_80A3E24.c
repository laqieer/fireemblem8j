#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "face.h"

void sub_80A3DC8(int x);

struct Unk80A3E24Proc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int timer;
    /* 30 */ STRUCT_PAD(0x30, 0x3F);
    /* 3F */ u8 unk_3f;
    /* 40 */ STRUCT_PAD(0x40, 0x4F);
    /* 4F */ s8 unk_4f;
    /* 50 */ s8 unk_50;
    /* 51 */ STRUCT_PAD(0x51, 0x52);
    /* 52 */ s16 unk_52;
    /* 54 */ s16 unk_54;
};

void sub_80A3E24(struct Unk80A3E24Proc * proc)
{
    int t;
    int n;
    int s;
    int blend;
    int bgX;
    int bgY;
    register int negX asm("r0");
    register int negY asm("r1");

    proc->timer++;
    t = proc->timer;
    n = 10 - t;

    s = 8 - ((n << 3) * n) / 100;
    blend = 0x10 - ((n << 4) * n) / 100;

    bgX = s * (proc->unk_4f << 3);
    bgY = s * (proc->unk_50 << 3);

    SetBlendConfig(1, blend, 0x10 - blend, 0);

    BG_SetPosition(0, bgX, bgY);
    BG_SetPosition(1, bgX, bgY);
    BG_SetPosition(2, bgX, bgY);

    negX = -bgX;
    proc->unk_52 = negX;
    negY = -bgY;
    proc->unk_54 = negY;

    sub_80A3DC8(negX);

    if (proc->unk_3f != 0)
        SetFacePosition(0, 0xD8 - bgX, 0x58 - bgY);

    if (proc->timer == 10)
        Proc_Break(proc);
}
