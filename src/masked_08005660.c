
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
void EndFace(struct FaceProc* proc);

//! FE8U = 0x08005758
void EndFaceById(int slot) {
    EndFace(gFaces[slot]);

    return;
}
