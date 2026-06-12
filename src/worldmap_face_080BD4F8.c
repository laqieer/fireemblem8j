#include "global.h"

#include "face.h"
#include "hardware.h"
#include "worldmap.h"

/* prototypes for same-file helpers called by this run */
void HandleWMFaceFade(struct WMFaceCtrlProc * proc);
void WMFaceCtrl_LoopExt(struct WMFaceCtrlProc * proc);

//! FE8U = 0x080B8630
void WMFaceCtrl_Loop(struct WMFaceCtrlProc * proc)
{
    u8 gUnknown_08205F28[] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 1, 1, 1, 1, 1, 2, 2,
        2, 2, 2, 2, 3, 3, 3, 3, 3,
        3, 3, 3, 3, 3, 2, 2, 2, 2,
        2, 2, 1, 1, 1, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0,

        -1,
    };

    proc->timer++;

    if (gUnknown_08205F28[proc->timer] == (u8)-1)
        proc->timer = 0;

    WMFaceCtrl_LoopExt(proc);

    if (proc->increment != 0)
        HandleWMFaceFade(proc);
}
