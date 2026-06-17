#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

extern struct ProcCmd ProcScr_TextPrint[];

char *StartTextPrint(struct Text *text, char * str, int interval, int char_per_tick)
{
    struct TextPrintProc * proc;

    if (interval == 0)
        Text_DrawString(text, str);

    if (char_per_tick == 0)
        char_per_tick = 1;

    proc = Proc_Start(ProcScr_TextPrint, PROC_TREE_3);

    proc->text = text;
    proc->str = str;

    proc->char_per_tick = char_per_tick;
    proc->interval = interval;
    proc->clock = 0;

    text->is_printing = TRUE;

    return GetStringLineEnd(str);
}
