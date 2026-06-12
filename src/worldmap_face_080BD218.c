#include "global.h"

#include "face.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080B8350
void HandleWMFaceFade(struct WMFaceCtrlProc * proc)
{
    int i;

    SetBlendConfig(1, proc->blendAmt >> 1, 0x10 - (proc->blendAmt >> 1), 0);

    proc->blendAmt += proc->increment;

    if (proc->blendAmt == 0)
    {
        for (i = 0; i < 2; i++)
        {
            if ((proc->faceHolderProc->faceWrapper[i].faceProc != NULL) && ((proc->faceHolderProc->faceWrapper[i].unk_0a == -1)))
            {
                EndFaceById(i);

                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
                proc->faceHolderProc->faceWrapper[i].faceProc = NULL;
            }
        }

        proc->increment = 0;
    }

    if (proc->blendAmt == 0x20)
    {
        for (i = 0; i < 2; i++)
        {
            struct FaceProc * faceProc = proc->faceHolderProc->faceWrapper[i].faceProc;

            if (faceProc != NULL && (proc->faceHolderProc->faceWrapper[i].unk_0a == 1))
            {
                SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) & ~(FACE_DISP_BLEND));
                proc->faceHolderProc->faceWrapper[i].unk_0a = 0;
            }
        }

        proc->increment = 0;
    }
}
