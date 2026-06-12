#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "face.h"
#include "functions.h"
#include "variables.h"
#include "bmlib.h"
#include "bg.h"
#include "scene.h"
#include "event.h"
#include "ekrbattle.h"

void ShinningEventCursor(int lo, int hi, int cur)
{
    int var = Interpolate(1, lo, hi, cur, 8);
    CpuFastCopy(Pal_EventCursorShinning, PAL_OBJ(0x2), 0x20);
    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, var);
    EnablePaletteSync();
}
