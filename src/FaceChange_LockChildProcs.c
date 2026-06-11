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

//! FE8U = 0x0800662C
void FaceChange_LockChildProcs(struct UnkFaceProc* proc) {

    if (proc->pFaceProc->pBlinkProc) {
        TryLockProc(proc->pFaceProc->pBlinkProc);
    }

    if (proc->pFaceProc->unk_44) {
        TryLockProc(proc->pFaceProc->unk_44);
    }

    return;
}
