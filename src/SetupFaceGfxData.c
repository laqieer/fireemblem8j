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

extern struct FaceVramEntry sFaceConfig[];

void SetupFaceGfxData(struct FaceVramEntry* config) {
    int i;

    if (config == 0) {
        config = gDefaultFaceConfig;
    }

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        sFaceConfig[i].tileOffset = config[i].tileOffset;
        sFaceConfig[i].paletteId = config[i].paletteId;
    }

    return;
}
