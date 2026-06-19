#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"




void OpAnimHS_FadeToBlackLoop(struct ProcOpAnimHS * proc)
{
    int i;

    if (--(*(int *)((char *)proc + 0x34)) > 0)
    {
        for (i = 0; i < 0x200; i++)
        {
            int color_r, color_g, color_b;
            const u16 * src = gPaletteOpAnimHsBackup;

            color_r = RED_VALUE(src[i]) * (*(int *)((char *)proc + 0x34)) / 4;
            color_g = GREEN_VALUE(src[i]) * (*(int *)((char *)proc + 0x34)) / 4;
            color_b = BLUE_VALUE(src[i]) * (*(int *)((char *)proc + 0x34)) / 4;

            gPaletteBuffer[i] = RGB(color_r, color_g, color_b);
        }
    }
    else
    {
        CpuFastFill16(0, gPaletteBuffer, 0x400);
        Proc_Break(proc);
    }
    EnablePaletteSync();
}
