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

//! FE8U = 0x0800B994
void CopyBgPalette(u8 src, u8 dst, u8 npals)
{
    CpuFastCopy(src * 0x10 + gPaletteBuffer, dst * 0x10 + gPaletteBuffer, npals * 0x20);
    EnablePaletteSync();
}
