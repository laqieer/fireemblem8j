#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B8680
ProcPtr StartWMFaceCtrl(ProcPtr parent) {
    return Proc_Start(ProcScr_WorldMapFaceCtrl, parent);
}
