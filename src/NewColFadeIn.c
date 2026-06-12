#include "global.h"
#include "hardware.h"
#include "colorfade.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_ColFadeIn[];

// clang-format on

//! FE8U = 0x080B2780
void NewColFadeIn(int speed, int kind, int color, ProcPtr parent)
{
    int i;

    struct ColFadeProc * proc = Proc_StartBlocking(ProcScr_ColFadeIn, parent);

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

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        gUisupport_1[i] = gPaletteBuffer[i];
        gPaletteBuffer[i] = 0;
    }

    return;
}
