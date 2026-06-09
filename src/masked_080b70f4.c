#include "global.h"

#include "hardware.h"
#include "colorfade.h"

extern u16 gUisupport_1[];

//! FE8U = 0x080B24DC
void ColFadeOut_Init(struct ColFadeProc * proc)
{
    int i;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        gUisupport_1[i] = gPaletteBuffer[i];
    }

    return;
}
