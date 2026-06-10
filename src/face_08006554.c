
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

struct FaceVramEntry EWRAM_DATA sFaceConfig[4] = { 0 };









































/* prototypes for same-file helpers called by this run */
const struct FaceData* GetPortraitData(int fid);

//! FE8U = 0x08006650
void FaceChange_LoadGfx(struct UnkFaceProc* proc) {
    struct FaceProc* faceProc;

    proc->pFaceInfo = GetPortraitData(proc->faceId);

    Decompress(proc->pFaceInfo->img, (void*)(sFaceConfig[proc->pFaceProc->faceSlot].tileOffset + 0x06010000));

    ApplyPalette(proc->pFaceInfo->pal, sFaceConfig[proc->pFaceProc->faceSlot].paletteId + 0x10);

    faceProc = proc->pFaceProc;
    faceProc->pFaceInfo = proc->pFaceInfo;
    faceProc->faceId = proc->faceId;

    return;
}
