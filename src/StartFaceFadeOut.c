#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"

extern struct FaceVramEntry sFaceConfig[];

void StartFaceFadeOut(struct FaceProc* proc) {

    // unused
    const struct FaceData* info = GetPortraitData(proc->faceId);

    StartPalFadeToBlack(sFaceConfig[proc->faceSlot].paletteId + 0x10, 12, proc);

    EndFaceIn8Frames(proc);

    return;
}
