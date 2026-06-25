#include "global.h"
#include "proc.h"
#include "hardware.h"

struct Proc80A7620
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ ProcPtr unk2C;
};

void sub_80A7620(struct Proc80A7620* proc)
{
    Proc_End(proc->unk2C);

    SetDispEnable(0, 0, 0, 0, 0);
}
