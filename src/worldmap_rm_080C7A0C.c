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



//! FE8U = 0x080C2C54
void WmDotPalAnim_OnEnd(void)
{
    return;
}

//! FE8U = 0x080C2C58
void WmDotPalAnim_Init(struct ProcGmapRmBaPalAnim * proc)
{
    ApplyPalette(Pal_WmPlaceDot_Standard, 0x15);
    EnablePaletteSync();

    proc->timer = 0;
    proc->flag = 1;

    return;
}
