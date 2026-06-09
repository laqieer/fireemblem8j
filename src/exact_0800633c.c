
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
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc);

//! FE8U = 0x08006438
void SetFaceBlinkControl(struct FaceProc* proc, int blinkControl) {
    struct FaceBlinkProc* blinkProc;

    if (blinkControl == 0) {
        blinkControl = proc->pFaceInfo->blinkKind;
    }

    blinkProc = proc->pBlinkProc;
    blinkProc->blinkControl = blinkControl;

    blinkProc->unk_38 = FaceBlinkProc_GenBlinkInterval(blinkProc);

    return;
}
