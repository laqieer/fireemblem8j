extern int GetWMFaceBg();
extern int GetWMFaceVramOffset();
#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B8844
void WmClearFace(int faceSlot, u16 config)
{
    int bg;
    u32 offset;

    struct WMFaceCtrlProc * proc = Proc_Find(ProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper* pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state.bits.state_3) {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    } else {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc != NULL && (pWrapper->y & 0x1000) == 0) {
        int tmp;

        DecompressFaceImg(offset / CHR_SIZE, (s16)pWrapper->faceId);
        ApplyFacePalette(4, (s16)pWrapper->faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        tmp = 0xFFFFFF00 & (u16)pWrapper->y;
        // Seems to be required to match...
        tmp &= (u16)pWrapper->y;

        if (config & 0x300) {
            tmp &= 0x0000FCFF;
            tmp |= (config & 0x300);
        } else {
            tmp &= 0x0000FCFF;
        }

        tmp &= 0xff00;

        pWrapper->y = tmp + 0x1000;

        pWrapper->unk_0a = -1;
        proc->increment = -2;

        if (proc->blendAmt == 0) {
            proc->blendAmt = 0x20;
            SetBlendConfig(1, 0x10, 0, 0);
        }
    }
}
