#include "global.h"
#include "proc.h"
#include "cgtext.h"

struct Proc80A4428
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int unk2C;
};

void sub_80A4428(struct Proc80A4428* proc)
{
    if (gPlaySt.unk_2B_00)
        proc->unk2C = 0x7B1;
    else
        proc->unk2C = 0x7B1;

    StartCgText(0x16, 0x10, -1, -1, proc->unk2C, (void*)0x06011000, -1, proc);
    SetCgTextFlags(GetCgTextFlags() | 0x0004000A);
}
