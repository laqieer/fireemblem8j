#include "global.h"
#include "proc.h"

#define sProcAllocListHead (*(struct Proc ***)0x02026A6C)

//! FE8U = 0x08002CE4
void FreeProcess(struct Proc *proc)
{
    // place the process back into the allocation list
    sProcAllocListHead--;
    *sProcAllocListHead = proc;
}
