#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapEffect[];
extern struct ProcCmd gProcScr_GmapEffectPal[];

//! FE8U = 0x080C12AC
void GmapEffect_Init(struct GmapEffectProc * proc)
{
    if (CountProcs(gProcScr_GmapEffect) < 2)
    {
        ApplyPalette(gPal_WorldmapNodeRevealEffect, 0x16);
        EnablePaletteSync();

        Decompress(gImg_WorldmapNodeRevealEffect, gGenericBuffer);
        Copy2dChr(gGenericBuffer, (void *)0x06013000, 6, 4);
    }

    if (Proc_Find(gProcScr_GmapEffectPal) == NULL)
    {
        Proc_Start(gProcScr_GmapEffectPal, proc);
    }

    proc->unk_2e = 0;
    proc->unk_2c = 0;
    proc->flags_0 = 0;

    return;
}
