#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B895C
void HideWmFace(void)
{
    int i;

    struct WMFaceCtrlProc * proc = Proc_Find(ProcScr_WorldMapFaceCtrl);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    for (i = 0; i < 2; i++)
    {
        struct WMFaceWrapper * pWrapper = &proc->faceHolderProc->faceWrapper[i];

        struct FaceProc * faceProc = pWrapper->faceProc;

        if (faceProc != NULL && (pWrapper->y & 0x1000) == 0)
        {
            SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | FACE_DISP_HIDDEN);

            pWrapper->y &= ~0xff;
            pWrapper->y += 0x1000;

            pWrapper->unk_0a = -1;
            proc->increment = -2;

            if (proc->blendAmt == 0)
            {
                proc->blendAmt = 0x20;
                SetBlendConfig(0, 0x10, 0, 0);
            }
        }
    }
}
