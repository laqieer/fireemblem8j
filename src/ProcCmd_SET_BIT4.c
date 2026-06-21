#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_UNK2 = (1 << 2),
};

//! FE8U = 0x080032C8
s8 ProcCmd_SET_BIT4(struct Proc *proc)
{
    proc->proc_flags |= PROC_FLAG_UNK2;
    proc->proc_scrCur++;

    return TRUE;
}
