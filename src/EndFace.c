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

//! FE8U = 0x08005738
void EndFace(struct FaceProc* proc) {
    gFaces[proc->faceSlot] = NULL;
    Proc_End(proc);

    return;
}
