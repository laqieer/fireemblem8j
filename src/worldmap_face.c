

#include "global.h"

#include "face.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080B820C
void WorldMapFaceHolder_Init(struct WMFaceHolderProc * proc)
{
    int i;
    for (i = 0; i < 2; i++)
    {
        proc->faceWrapper[i].faceProc = NULL;
        proc->faceWrapper[i].unk_0a = 0;
        proc->faceWrapper[i].y = 0;
        proc->faceWrapper[i].x = 0;
        proc->faceWrapper[i].faceId |= 0xFFFF;
    }
}

//! FE8U = 0x080B823C
void WMFaceCtrl_Init(struct WMFaceCtrlProc * proc)
{
    proc->timer = 0;
    proc->faceHolderProc = Proc_Start(ProcScr_WorldMapFaceHolder, proc);
    proc->increment = 0;
    proc->blendAmt = 0;
    proc->unk_33 = 0;
    proc->unk_34 = 0;
}

//! FE8U = 0x080B826C
int GetWMFaceTileXAndScroll(int xIn, int *xOut) {
    int a = xIn - 0x30;
    int b;

    if (a < 0)
        b = xIn - 0x29;
    else
        b = a;

    xIn = b;
    xIn = xIn >> 3;
    *xOut = xIn * 8 - a;

    return xIn;
}

//! FE8U = 0x080B828C
int GetWMFaceBg(void) {
    return (gGMData.state.bits.state_3) ? BG_2 : BG_1;
}

//! FE8U = 0x080B82A8
int GetWMFaceVramOffset(void) {
    return (gGMData.state.bits.state_3) ? 0x5000 : 0x1800;
}
