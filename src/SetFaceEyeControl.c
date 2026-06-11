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

//! FE8U = 0x080064D4
void SetFaceEyeControl(struct FaceProc* proc, int unk) {
    proc->pBlinkProc->unk_32 = unk;
    return;
}
