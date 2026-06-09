
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
void FaceRefreshSprite(struct FaceProc* proc);

//! FE8U = 0x08005770
int SetFaceDisplayBits(struct FaceProc* proc, int disp) {

    if (proc == 0) {
        return 0;
    }

    proc->displayBits = disp;

    FaceRefreshSprite(proc);

    return proc->displayBits;
}
