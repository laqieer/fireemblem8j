
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
void SetFaceBlinkControl(struct FaceProc* proc, int blinkControl);

//! FE8U = 0x08006458
void SetFaceBlinkControlById(int slot, int blinkControl) {
    SetFaceBlinkControl(gFaces[slot], blinkControl);
    return;
}
