#include "global.h"
#include "proc.h"
#include "prepscreen.h"

void SetPrepScreenMenuSelectedItem(int index)
{
    int i, cur = 0;

    struct ProcPrepMenu * proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (proc->cmds[i] == NULL)
                continue;

            if (proc->cmds[i]->index == index)
            {
                proc->cur_index = cur;
                return;
            }
            cur++;
        }
    }
}
