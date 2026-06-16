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

void StartFaceFadeIn(struct FaceProc* proc) {
    const struct FaceData* info = GetPortraitData(proc->faceId);

    SetBlackPal(sFaceConfig[proc->faceSlot].paletteId + 0x10);
    StartPalFade(info->pal, sFaceConfig[proc->faceSlot].paletteId + 0x10, 12, proc);

    return;
}
