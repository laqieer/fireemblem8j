#include "global.h"
#include "proc.h"
#include "prepscreen.h"

extern struct ProcCmd ProcScr_PrepMenu[];
extern void ResetPrepMenuScreen(void);

void EndPrepScreenMenu(void)
{
    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        ResetPrepMenuScreen();
        Proc_Goto(proc, 10);
    }
}
