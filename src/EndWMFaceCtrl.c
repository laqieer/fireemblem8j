#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B8694
void EndWMFaceCtrl(void)
{
    Proc_EndEach(ProcScr_WorldMapFaceCtrl);
    return;
}
