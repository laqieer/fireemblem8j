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




struct FaceProc* StartFace(int slot, int fid, int x, int y, int disp) {
    struct FaceProc* proc;
    const struct FaceData* info;

    if (gFaces[slot] != NULL) {
        return NULL;
    }

    proc = Proc_Start(gProcScr_E_FACE, PROC_TREE_5);

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

    if (disp & FACE_DISP_BIT_12) {
        proc->unk_44 = NULL;
        proc->pBlinkProc = NULL;
    } else {
        proc->unk_44 = Proc_Start(gProcScr_Face_1, proc);
        proc->pBlinkProc = Proc_Start(gProcScr_FaceBlink, proc);
    }

    proc->displayBits = ~disp;

    SetFaceDisplayBits(proc, disp);

    return proc;
}
