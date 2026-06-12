#include "global.h"
#include "hardware.h"
#include "colorfade.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ColFadeOut[];

// clang-format on

//! FE8U = 0x080B272C
void NewColFadeOut(int speed, int kind, int color, ProcPtr parent)
{
    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeOut, parent);

    proc->speed = speed;
    proc->color = color;
    proc->current = 0;

    switch (kind)
    {
        case 0:
            proc->start = 0x80;
            proc->amount = 0x80;

            break;

        case 1:
            proc->start = 0;
            proc->amount = 0x200;

            break;

        case 2:
            proc->start = 0;
            proc->amount = 0x400;

            break;
    }

    return;
}
