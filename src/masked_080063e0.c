
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
void SetFaceEyeControl(struct FaceProc* proc, int unk);

//! FE8U = 0x080064DC
void SetFaceEyeControlById(int slot, int unk) {
    SetFaceEyeControl(gFaces[slot], unk);
    return;
}
