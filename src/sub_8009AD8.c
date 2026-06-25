#include "global.h"
#include "proc.h"

void sub_80C165C(void);

struct Proc8009AD8
{
    STRUCT_PAD(0x00, 0x29);
    /* 29 */ u8 unk29;
};

void sub_8009AD8(struct Proc8009AD8 *proc)
{
    switch (proc->unk29)
    {
    case 0:
        sub_80C165C();
        /* fallthrough */
    case 1:
    case 2:
    case 3:
        Proc_Goto(proc, 6);
        break;
    case 4:
        Proc_Goto(proc, 7);
        break;
    case 5:
        Proc_Goto(proc, 0x18);
        break;
    case 6:
        Proc_Goto(proc, 0xB);
        break;
    case 7:
        Proc_Goto(proc, 0xC);
        break;
    case 8:
        Proc_Goto(proc, 0xD);
        break;
    case 13:
        Proc_Goto(proc, 0xE);
        break;
    }
}
