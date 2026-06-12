extern int GetWMFaceBg();
extern int GetWMFaceVramOffset();
#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapFaceCtrl[];

//! FE8U = 0x080B86CC
void WmDrawFace(int faceSlot, int faceId, u16 config)
{
    int bg;
    u32 offset;

    struct WMFaceCtrlProc * proc = Proc_Find(ProcScr_WorldMapFaceCtrl);

    struct WMFaceWrapper * pWrapper = proc->faceHolderProc->faceWrapper + faceSlot;

    if (gGMData.state.bits.state_3)
    {
        SetBlendTargetA(0, 0, 1, 0, 0);
        SetBlendTargetB(0, 1, 0, 1, 1);
    }
    else
    {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
    }

    bg = GetWMFaceBg();
    offset = GetWMFaceVramOffset();

    if (pWrapper->faceProc == NULL)
    {
        int x;
        int disp;
        struct FaceProc * faceProc;

        pWrapper->faceId = faceId;

        pWrapper->x = config & 0x00ff;
        pWrapper->y = (config & 0xff00) + 0x800;

        DecompressFaceImg(offset / CHR_SIZE, faceId);
        ApplyFacePalette(4, faceId);

        BG_Fill(BG_GetMapBuffer(bg), 0);

        x = pWrapper->x;

        if (config & 0x400)
            disp = (FACE_DISP_HIDDEN | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1) | FACE_DISP_FLIPPED);
        else
            disp = (FACE_DISP_HIDDEN | FACE_DISP_BLEND | FACE_DISP_KIND(FACE_96x80) | FACE_DISP_HLAYER(FACE_HLAYER_1));

        if (config & 0x8000)
            disp = disp | FACE_DISP_BIT_13;

        faceProc = StartFace2(faceSlot, faceId, x, 28, disp);

        pWrapper->faceProc = faceProc;

        if ((config & 0x6000) == 0x6000)
            faceProc->spriteLayer = 6;
        else if (config & 0x4000)
            faceProc->spriteLayer = 5;
        else if (config & 0x2000)
            faceProc->spriteLayer = 4;
        else
            faceProc->spriteLayer = 3;

        SetFaceBlinkControlById(faceSlot, 5);

        pWrapper->unk_0a = +1;
        proc->increment = +2;

        if (proc->blendAmt == 0x20)
        {
            proc->blendAmt = 0;
            SetBlendConfig(1, 0, 0x10, 0);
        }
    }
}
