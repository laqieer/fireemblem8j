#include "global.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "event.h"
#include "hardware.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmmap.h"
#include "bksel.h"
#include "chapterdata.h"

//! FE8U = 0x0800BA04
void BackupPalette(u8 a, u8 b)
{
    u16 * palPtr = gPaletteBuffer + a * 0x10;

    u16 * ptr = (void *)gLoadUnitBuffer;
    *ptr++ = a;
    *ptr++ = b;

    CpuFastCopy(palPtr, (u16 *)gLoadUnitBuffer + 2, b * 0x20);
}

//! FE8U = 0x0800BA34
void RestorePalette(void)
{
    u16 * ptr = (void *)gLoadUnitBuffer;

    int b = *ptr++;
    int c = *ptr++;

    CpuFastCopy(ptr, gPaletteBuffer + b * 0x10, c * 0x20);
    EnablePaletteSync();
    return;
}

//! FE8U = 0x0800BA5C
void SetSomeRealCamPos(int x, int y, s8 unk)
{
    int xOut;
    int yOut;

    if (unk == 1)
    {
        StoreAdjustedCameraPositions(x, y, &xOut, &yOut);
        gBmSt.camera.x = xOut * 16;
        gBmSt.camera.y = yOut * 16;
    }
    else
    {
        gBmSt.camera.x = GetCameraAdjustedX(x * 16);
        gBmSt.camera.y = GetCameraAdjustedY(y * 16);
    }

    return;
}
