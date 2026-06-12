#include "global.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapPalFade[];

//! FE8U = 0x080BF730
s8 IsGmPalFadeActive(void)
{
    return (Proc_Find(ProcScr_GmapPalFade)) ? 1 : 0;
}
