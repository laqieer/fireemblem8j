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
    /* 64 */ struct ClassReelEnt * classReelEnt;
};

ProcPtr StartClassNameIntroLetter(ProcPtr parent, u8 index);
ProcPtr StartClassNameIntroIcon(ProcPtr parent, u8 classId);
extern struct ProcCmd CONST_DATA gProcScr_ClassIntro_FlareFX[];

void ClassIntro_LoopIn(struct OpInfoEnterProcJ * proc)
{
    int diff;
    int idx;
    ProcPtr p;

    if (proc->timer == 60)
    {
        proc->iconProc = StartClassNameIntroIcon(proc, proc->classReelEnt->unk_0E);
        Proc_Start(gProcScr_ClassIntro_FlareFX, proc);
    }

    if (proc->timer >= 96)
    {
        Proc_Break(proc);
        proc->timer = 0;
        return;
    }

    if (proc->timer > 15)
    {
        diff = (proc->timer - 0x10);
        if ((diff & 3) == 0)
        {
            idx = (diff / 4) + 1;
            if (((diff / 4) + 1) < proc->classReelEnt->unk_0C)
            {
                p = StartClassNameIntroLetter(proc, idx);
                proc->letterProcs[(diff / 4) + 1] = p;
            }
        }
    }

    proc->timer++;
    return;
}
