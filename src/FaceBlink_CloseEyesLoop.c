extern int FaceBlink_PutEyeSprite();
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

//! FE8U = 0x0800632C
void FaceBlink_CloseEyesLoop(struct FaceBlinkProc* proc) {

    if (proc->unk_34 < 6) {
        FaceBlink_AnimLoop(proc);
        return;
    }

    FaceBlink_PutEyeSprite(proc, 0);

    if (proc->unk_32 == 0) {
        Proc_Goto(proc, 1);
    }

    if (proc->unk_32 == 3) {
        Proc_Goto(proc, 3);
    }

    return;
}
