
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











































/* prototypes for same-file helpers called by this run */
void SetupFaceGfxData(struct FaceVramEntry* config);
void EndFaceById(int slot);

//! FE8U = 0x08005528
void ResetFaces(void) {
    int i;

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        EndFaceById(i);
    }

    SetupFaceGfxData(0);

    return;
}
