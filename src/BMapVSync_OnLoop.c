#include "global.h"
#include "proc.h"

//! FE8U = 0x08030094
void BMapVSync_OnLoop(struct Proc* proc)
{
    Proc_Goto(proc, 0);
}
