#include "global.h"
#include "proc.h"
#include "opinfo.h"

struct OpInfoEnterProcJ
{
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 classNameLength;

    /* 2F */ u8 _pad1[0x34 - 0x2F];

    /* 34 */ ProcPtr letterProcs[10];
    /* 5C */ ProcPtr iconProc;
    /* 60 */ ProcPtr parentProc;
    /* 64 */ struct ClassReelEnt* classReelEnt;
};

//! FE8U = 0x080B7A98
void ClassIntro_LoopOut(struct OpInfoEnterProcJ* proc)
{
    if (proc->timer == 20)
    {
        Proc_Goto(proc->iconProc, 4);
    }

    if (proc->timer >= 80)
    {
        Proc_Break(proc);
        proc->timer = 0;

        return;
    }

    if ((proc->timer % 6) == 0)
    {
        if ((proc->timer / 6) < proc->classReelEnt->unk_0C)
        {
            Proc_Break(proc->letterProcs[proc->timer / 6]);
        }
    }

    proc->timer++;

    return;
}
