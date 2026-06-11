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

//! FE8U = 0x08005D70
void FaceBgBlink_WaitLoop(struct FaceBlinkProc* proc) {

    proc->unk_38--;

    if (proc->unk_38 >= 0) {
        return;
    }

    proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
    proc->unk_34 = 0;

    Proc_Break(proc);

    return;
}
