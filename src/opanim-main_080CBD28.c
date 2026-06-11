#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

void OpAnimBldAlphaUpdateBgPalette(struct ProcOpAnimBLDALPHA * proc)
{
    u16 * pal;
    int i, ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x1F, proc->timer, 0x3E);

    int color = ret;
    int b = ret << 10;
    int g = ret << 5;

    color = b | g | color;

    for (i = 0; i < 0x10; i++)
        gPaletteBuffer[i] = color;

    EnablePaletteSync();

    if (proc->timer == 0x3E)
    {
        proc->timer = 0;
        gOpAnimSt.pal = 0x7FFF;
        SetBlendTargetA(0, 0, 0, 0, 1);
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}
