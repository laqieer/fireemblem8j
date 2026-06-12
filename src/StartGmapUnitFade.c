#include "global.h"
#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapUnitFade[];

// clang-format on

//! FE8U = 0x080BB3E8
ProcPtr StartGmapUnitFade(int index, int palA, int palB, int arg3, ProcPtr parent)
{
    struct GMapUnitFadeProc * proc;

    if (parent)
    {
        proc = Proc_StartBlocking(ProcScr_GmapUnitFade, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapUnitFade, PROC_TREE_3);
    }

    proc->unk_29 = palA;
    proc->unk_2a = palB;
    proc->unk_2c = arg3;

    if (palA >= 0)
    {
        CpuCopy16(gPaletteBuffer + palA * 0x10 + 0x100, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
    }
    else
    {
        CpuFill16(0, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
    }

    EnablePaletteSync();

    proc->unk_30[0] = index;
    proc->unk_37 = 1;

    // return proc; // BUG
}
