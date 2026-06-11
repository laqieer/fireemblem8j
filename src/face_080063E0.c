#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "bm.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "constants/faces.h"
#include "face.h"
/* TU-private data externs bound at their JP addresses */
extern struct FaceVramEntry sFaceConfig[];

//! FE8U = 0x080064DC
void SetFaceEyeControlById(int slot, int unk) {
    SetFaceEyeControl(gFaces[slot], unk);
    return;
}

//! FE8U = 0x080064F4
struct FaceProc* StartFace2(int slot, int fid, int x, int y, int disp) {
    struct FaceProc* proc;
    const struct FaceData* info;
    s16 oam2Layer;

    if (gFaces[slot] != NULL) {
        return NULL;
    }

    proc = Proc_Start(gProcScr_E_FACE_ExtraFrame, PROC_TREE_5);

    gFaces[slot] = proc;

    info = GetPortraitData(fid);

    if (disp & FACE_DISP_BIT_13) {
        CpuFastFill(0, PAL_OBJ(0) + PAL_OFFSET(sFaceConfig[slot].paletteId), 0x20);
        EnablePaletteSync();
    } else {
        ApplyPalette(info->pal, sFaceConfig[slot].paletteId + 0x10);
    }

    proc->pFaceInfo = info;

    proc->faceSlot = slot;
    proc->faceId = fid;

    proc->spriteLayer = 5;

    proc->xPos = x;
    proc->yPos = y;

    proc->unk_44 = NULL;
    proc->pBlinkProc = NULL;

    proc->displayBits = disp;

    FaceRefreshSprite(proc);

    switch (disp & FACE_DISP_HLAYER_MASK) {
        case FACE_DISP_HLAYER(FACE_HLAYER_0):
            oam2Layer = OAM2_LAYER(0);
            break;

        case FACE_DISP_HLAYER(FACE_HLAYER_1):
            oam2Layer = OAM2_LAYER(1);
            break;

        case FACE_DISP_HLAYER(FACE_HLAYER_3):
            oam2Layer = OAM2_LAYER(3);
            break;

        default:
            oam2Layer = OAM2_LAYER(2);
            break;
    }

    proc->oam2 = (sFaceConfig[slot].tileOffset / CHR_SIZE) + ((sFaceConfig[slot].paletteId & 0xF) * 0x1000) + oam2Layer;

    return proc;
}

//! FE8U = 0x08006618
void SetFacePosition(int slot, int x, int y) {

    gFaces[slot]->xPos = x;
    gFaces[slot]->yPos = y;

    return;
}
