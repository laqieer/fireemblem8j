#include "global.h"
#include "proc.h"

struct Proc8055E2C
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk29;
    /* 2A */ STRUCT_PAD(0x2A, 0x2C);
    /* 2C */ u16 unk2C;
    /* 2E */ u16 unk2E;
};

extern struct ProcCmd gProcScr_855E2C[];
extern struct Proc8055E2C* gpProcEfxSpellCast;

void sub_8055E2C(void)
{
    struct Proc8055E2C* proc = Proc_Start(gProcScr_855E2C, PROC_TREE_4);

    proc->unk29 = 0;
    proc->unk2C = 0;
    proc->unk2E = 4;

    if (gpProcEfxSpellCast != NULL)
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}
