
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











































//! FE8U = 0x08005FD4
void FaceMouth_Init(struct FaceBlinkProc* proc) {
    proc->pFaceProc = (struct FaceProc*)(proc->proc_parent);
    proc->unk_32 = 0;

    return;
}
