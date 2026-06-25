#include "global.h"
#include "proc.h"

extern const struct ProcCmd gUnknown_08A95E20[];

struct Proc80A7650
{
    /* 00 */ PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x30);
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
};

bool sub_80A7650(int a, int b, ProcPtr parent)
{
    struct Proc80A7650 * proc = Proc_StartBlocking(gUnknown_08A95E20, parent);

    proc->unk_30 = a;
    proc->unk_34 = b;
}
