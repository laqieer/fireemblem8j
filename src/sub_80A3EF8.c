#include "global.h"

#include "proc.h"

// JP-only tactician/menu cursor state machine. Field offsets from gbadisasm oracle.
struct AuguryCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ int unk_2c;
    /* 30 */ STRUCT_PAD(0x30, 0x3C);
    /* 3C */ u8 unk_3c;
    /* 3D */ u8 unk_3d;
    /* 3E */ STRUCT_PAD(0x3E, 0x4F);
    /* 4F */ s8 unk_4f;
};

extern void sub_80B1844(int);

void sub_80A3EF8(struct AuguryCursorProc * proc)
{
    proc->unk_2c = 0;

    if (proc->unk_4f > 0)
    {
        sub_80B1844(1);

        if (proc->unk_3c == 2)
        {
            proc->unk_3d = 1 - proc->unk_3d;
            proc->unk_3c = 0;
        }
        else
        {
            proc->unk_3c++;
        }
    }

    if (proc->unk_4f < 0)
    {
        sub_80B1844(0);

        if (proc->unk_3c == 0)
        {
            proc->unk_3d = 1 - proc->unk_3d;
            proc->unk_3c = 2;
        }
        else
        {
            proc->unk_3c--;
        }
    }
}
