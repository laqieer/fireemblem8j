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

void MixPaletteCore(struct ProcMixPalette * proc, int val)
{
    int i, j;

    u16 * dst = gPaletteBuffer + PAL_COLOR_OFFSET(proc->targetPalId, 0);
    u16 * ptrA = proc->srcA;
    u16 * ptrB = proc->srcB;

    for (i = 0; i < proc->palCount; i++)
    {
        for (j = 0; j < 0x10; j++)
        {
            *dst = ((((*ptrA & RED_MASK)   * (0x80 - val) + val * (*ptrB & RED_MASK))   >> 7) & RED_MASK) +
                   ((((*ptrA & GREEN_MASK) * (0x80 - val) + val * (*ptrB & GREEN_MASK)) >> 7) & GREEN_MASK) +
                   ((((*ptrA & BLUE_MASK)  * (0x80 - val) + val * (*ptrB & BLUE_MASK))  >> 7) & BLUE_MASK);

            dst++;
            ptrA++;
            ptrB++;
        }
    }
    EnablePaletteSync();
}
