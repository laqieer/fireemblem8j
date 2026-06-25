#include "global.h"
#include "bmlib.h"
#include "proc.h"

struct Proc8077C60
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
    /* 30 */ STRUCT_PAD(0x30, 0x32);
    /* 32 */ s16 unk32;
    /* 34 */ s16 unk34;
    /* 36 */ STRUCT_PAD(0x36, 0x60);
    /* 60 */ u16 * unk60;
};

void sub_8077C60(struct Proc8077C60 * proc)
{
    proc->unk60[1] = Interpolate(1, proc->unk32, proc->unk34, proc->unk2C, proc->unk2E);

    proc->unk2C++;

    if (proc->unk2C > proc->unk2E)
    {
        proc->unk2C = 0;
        proc->unk2E = 0x14;
        Proc_Break(proc);
    }
}
