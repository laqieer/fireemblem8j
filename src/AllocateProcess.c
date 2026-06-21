#include "global.h"
#include "proc.h"

#define sProcAllocListHead (*(struct Proc ***)0x02026A6C)

//! FE8U = 0x08002CD4
struct Proc *AllocateProcess(void)
{
    // retrieve the next entry in the allocation list
    struct Proc *proc = *sProcAllocListHead;
    sProcAllocListHead++;
    return proc;
}
