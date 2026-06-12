#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B86A4
int GetWMFaceBlendAmt(void)
{
    struct WMFaceCtrlProc * proc;

    Proc_Find(ProcScr_WorldMapFaceCtrl);

    proc = Proc_Find(ProcScr_WorldMapFaceCtrl);

    if (proc) {
        return proc->blendAmt >> 1;
    } else {
        return 0x10;
    }
}
