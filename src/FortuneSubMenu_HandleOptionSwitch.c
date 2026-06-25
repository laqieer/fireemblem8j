#include "global.h"
#include "proc.h"

// JP-only 占い (augury/fortune) sub-menu option dispatcher.
// Reads the selected option index at proc+0x29 and jumps the proc to the
// matching label. Field offsets read from the gbadisasm oracle.
struct FortuneSubMenuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 option;
};

void FortuneSubMenu_HandleOptionSwitch(struct FortuneSubMenuProc * proc)
{
    switch (proc->option)
    {
    case 0:
        Proc_Goto(proc, 2);
        break;
    case 1:
        Proc_Goto(proc, 3);
        break;
    case 2:
        Proc_Goto(proc, 4);
        break;
    }
}
