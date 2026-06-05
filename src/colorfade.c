#include "global.h"

#include "hardware.h"
#include "colorfade.h"

extern u16 gUisupport_1[];

//! FE8U = 0x080B251C
void ColFadeOut_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    for (i = proc->start; i < proc->start + proc->amount; i++)
    {
        int r, r1, r2;
        int g, g1, g2;
        int b, b1, b2;

        b1 = (gUisupport_1[i] & BLUE_MASK);
        b2 = (proc->color & BLUE_MASK);
        b2 = b1 - b2;
        b = ((b2 * val / 0x100) + proc->color) & BLUE_MASK;

        g1 = (gUisupport_1[i] & GREEN_MASK);
        g2 = (proc->color & GREEN_MASK);
        g2 = (g1 - g2);
        g = ((g2 * val / 0x100) + proc->color) & GREEN_MASK;

        r1 = (gUisupport_1[i] & RED_MASK);
        r2 = (proc->color & RED_MASK);
        r2 = r1 - r2;
        r = ((r2 * val / 0x100) + proc->color) & RED_MASK;

        gPaletteBuffer[i] = b | g | r;
    }

    EnablePaletteSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080B2608
void ColFadeIn_Loop(struct ColFadeProc * proc)
{
    int i;

    u16 val = 0x100 - proc->current;

    if (val != 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            int r, r1, r2;
            int g, g1, g2;
            int b, b1, b2;

            b1 = (proc->color & BLUE_MASK);
            b2 = (gUisupport_1[i] & BLUE_MASK);
            b2 = b1 - b2;
            b = ((b2 * val / 0x100) + gUisupport_1[i]) & BLUE_MASK;

            g1 = (proc->color & GREEN_MASK);
            g2 = (gUisupport_1[i] & GREEN_MASK);
            g2 = (g1 - g2);
            g = ((g2 * val / 0x100) + gUisupport_1[i]) & GREEN_MASK;

            r1 = (proc->color & RED_MASK);
            r2 = (gUisupport_1[i] & RED_MASK);
            r2 = r1 - r2;
            r = ((r2 * val / 0x100) + gUisupport_1[i]) & RED_MASK;

            gPaletteBuffer[i] = b | g | r;
        }
    }

    EnablePaletteSync();

    proc->current += proc->speed;

    if (val == 0)
    {
        for (i = proc->start; i < proc->start + proc->amount; i++)
        {
            gPaletteBuffer[i] = gUisupport_1[i];
            gPaletteBuffer[i] = gUisupport_1[i];
            gPaletteBuffer[i] = gUisupport_1[i];
        }

        Proc_Break(proc);
    }

    return;
}
