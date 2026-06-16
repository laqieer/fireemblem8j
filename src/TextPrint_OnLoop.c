#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

void TextPrint_OnLoop(struct TextPrintProc * proc)
{
    int i;

    proc->clock--;
    if (proc->clock > 0)
        return;

    proc->clock = proc->interval;

    for (i = 0; i < proc->char_per_tick; ++i) {
        switch (*proc->str) {
        case 0: // end
            // fallthrough

        case 1: // newline
            proc->text->is_printing = false;
            Proc_Break(proc);

            return;

        case 4: // space?
            proc->str++;
            Text_Skip(proc->text, 6);

            break;

        default:
            proc->str = Text_DrawCharacter(proc->text, proc->str);

        }
    }
}
