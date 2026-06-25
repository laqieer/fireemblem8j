#include "global.h"
#include "functions.h"
#include "variables.h"

struct Unk80A4088Proc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3C);
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
};

void sub_80A7650(int a, int b, ProcPtr parent);

void sub_80A4088(struct Unk80A4088Proc * proc)
{
    sub_80A7650(proc->unk_3c, proc->unk_3d, proc);
}
