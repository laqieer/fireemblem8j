#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "prepscreen.h"

void SetPrepScreenMenuItem(int index, const void * func, int color, int msg, int msg_rtext)
{
    int i;
    struct ProcPrepMenu * proc;
    proc = Proc_Find(ProcScr_PrepMenu);

    if (proc != NULL)
    {
        for (i = 0; i < 8; i++)
        {
            if (!proc->cmds[i])
                continue;

            if (proc->cmds[i]->index == index)
            {
                proc->cmds[i]->effect = func;
                proc->cmds[i]->color = color;
                proc->cmds[i]->msg = msg;
                proc->cmds[i]->msg_rtext = msg_rtext;
                return;
            }
        }

        i = proc->max_index;
        proc->cmds[i] = Proc_Start(ProcScr_PrepScreenMenuDummyItem, proc);
        proc->cmds[i]->index = index;
        proc->cmds[i]->effect = func;
        proc->cmds[i]->color = color;
        proc->cmds[i]->msg = msg;
        proc->cmds[i]->msg_rtext = msg_rtext;
        InitText(&proc->cmds[i]->text, 7);
        proc->max_index++;
    }
}
