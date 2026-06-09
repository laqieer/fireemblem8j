
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
int SetFaceDisplayBits(struct FaceProc* proc, int disp);

//! FE8U = 0x0800578C
int SetFaceDisplayBitsById(int slot, int disp) {
    return SetFaceDisplayBits(gFaces[slot], disp);
}
