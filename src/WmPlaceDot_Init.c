extern int StartWmDotPalAnim();
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WmPlaceDot[];

//! FE8U = 0x080C2EA4
void WmPlaceDot_Init(struct ProcWmPlaceDot * proc)
{
    if (CountProcs(ProcScr_WmPlaceDot) > 1)
    {
        return;
    }

    StartWmDotPalAnim(NULL);

    Decompress(Img_WorldMapPlaceDot, (void *)(0x060133C0));
    ApplyPalette(Pal_WmPlaceDot_Standard, 0x14);
    EnablePaletteSync();

    Proc_Goto(proc, 1);

    return;
}
