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

//! FE8U = 0x080063C4
void FaceBlink_WinkLoop(struct FaceBlinkProc* proc) {
    int r5 = 2;

    switch (proc->unk_34) {
        case 3:
        case 4:
        case 5:
            r5 = 0;
            break;

        case 0:
        case 1:
        case 2:
        case 6:
        case 7:
        case 8:
            r5 = 1;
            break;

        case 10:
            Proc_Goto(proc, 0);
            proc->unk_32 = 0;
    }

    FaceBlink_PutEyeSprite(proc, 0x80 + r5);

    proc->unk_34++;

    return;
}
