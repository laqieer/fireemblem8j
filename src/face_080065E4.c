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

//! FE8U = 0x080066E0
void StartFaceChange(struct FaceProc* parent, int fid) {
    struct UnkFaceProc* proc = Proc_Start(gProcScr_Face_2, parent);

    proc->pFaceProc = parent;
    proc->faceId = fid;

    return;
}

//! FE8U = 0x080066FC
void DecompressFaceImg(int offset, int fid) {
    Decompress(GetPortraitData(fid)->img, (void*)(offset * 0x20 + VRAM));
    return;
}

//! FE8U = 0x0800671C
void ApplyFacePalette(int pal, int fid) {
    ApplyPalette(GetPortraitData(fid)->pal, pal);
    return;
}
