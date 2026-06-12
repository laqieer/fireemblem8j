#include "global.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u8 gUnk_16[];
extern u8 gUnk_23[];

//! FE8U = 0x080C09B8
void ClearWMPlayerInterfaceTilemapBuffers(void)
{
    CpuFastFill(0, gUnk_16, 0x500);
    CpuFastFill(0, gUnk_23, 0x500);
    return;
}
