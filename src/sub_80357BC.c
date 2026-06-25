#include "global.h"
#include "proc.h"
#include "hardware.h"

extern void sub_80356C8(int);
extern const u8 gUnk_085C66D0[];

struct ProcUnk80357BC
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ s16 _58;
    /* 5A */ s16 _5a;
};

// JP-only proc update step.
void sub_80357BC(struct ProcUnk80357BC *proc)
{
    sub_80356C8(gUnk_085C66D0[proc->_5a]);

    if (proc->_5a != 0)
        proc->_5a--;

    if (proc->_58 <= 0x1d)
        proc->_58++;

    if (proc->_58 == 0x1e && !(gKeyStatusPtr->heldKeys & 4))
        Proc_Break(proc);
}
