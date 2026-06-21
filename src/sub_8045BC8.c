#include "global.h"
#include "proc.h"
#include "sio.h"

extern u8 data_085D4760[];

void SioMain2_WaitEndAndRoute(ProcPtr proc)
{
    if (Proc_Find((const struct ProcCmd *)data_085D4760) != NULL)
    {
        return;
    }

    if (gLinkArenaSt.unk_0B == 1)
    {
        Proc_Goto(proc, 1);
    }

    if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 4);
    }

    Proc_Break(proc);

    return;
}
