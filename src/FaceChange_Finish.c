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

//! FE8U = 0x080066A8
void FaceChange_Finish(struct UnkFaceProc* proc) {
    if (proc->pFaceProc->pBlinkProc) {
        proc->pFaceProc->pBlinkProc->blinkControl = proc->pFaceInfo->blinkKind;

        Proc_Goto(proc->pFaceProc->pBlinkProc, 0);

        TryUnlockProc(proc->pFaceProc->pBlinkProc);
    }

    if (proc->pFaceProc->unk_44) {
        TryUnlockProc(proc->pFaceProc->unk_44);
    }

    return;
}
