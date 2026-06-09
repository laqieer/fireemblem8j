
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











































//! FE8U = 0x08005D64
void FaceBgBlink_Init(struct FaceBlinkProc* proc) {
    proc->pFaceProc = NULL;
    proc->unk_38 = 120;
    proc->unk_32 = 0;

    return;
}
