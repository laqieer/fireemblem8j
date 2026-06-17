#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void OpAnimHS_InitFadeToBlack(struct ProcOpAnimHS * proc)
{
    CpuFastCopy(gPaletteBuffer, gPaletteOpAnimHsBackup, 0x400);
    *(int *)((char *)proc + 0x34) = 4; /* JP field offset 0x34, not US 0x38 */
}
