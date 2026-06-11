#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void SysboxTextMain(struct ProcSysboxText * proc)
{
    char ch;
    int i;

    SetTextFont(&proc->font);

    if (proc->timer == proc->delay)
        proc->timer = 0;

    if (proc->timer == 0)
    {
        for (i = 0; i < proc->speed; i++)
        {
            const char * str = proc->str;
            if (*str == '\0')
            {
                Proc_Break(proc);
                break;
            }

            ch = *str;
            if (ch == '\1')
            {
                proc->line++;
                proc->str++;
            }
            else
            {
                proc->str =
                    Text_DrawCharacter(&proc->texts[proc->line], proc->str);
            }
        }
    }
    proc->timer++;
    SetTextFont(NULL);
}
