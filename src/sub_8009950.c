#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmsave.h"
#include "soundwrapper.h"

struct SuspendResumeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2E);
    /* 2E */ s16 timer;
};

void sub_8002398(int, int);
void sub_8002DE4(ProcPtr proc);

void sub_8009950(struct SuspendResumeProc * proc)
{
    if (!(gKeyStatusPtr->heldKeys & 8))
    {
        sub_8002DE4(proc);
        return;
    }

    if (--proc->timer < 0)
    {
        if (IsValidSuspendSave(3))
        {
            ReadSuspendSave(3);
            Proc_Goto(proc, 7);
        }
        else
        {
            sub_8002398(0x43, 0);
            StartBgmVolumeChange(0, 0xc0, 0x3c, 0);
            Proc_Goto(proc, 4);
        }
    }
}
