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

//! FE8U = 0x08006458
void SetFaceBlinkControlById(int slot, int blinkControl) {
    SetFaceBlinkControl(gFaces[slot], blinkControl);
    return;
}

//! FE8U = 0x08006470
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc) {
    int var = AdvanceGetLCGRNValue() >> 16;

    switch (proc->blinkControl) {
        case 3:
            return (var >> 7) + 300;

        case 1:
            return (var >> 7) + 30;

        case 2:
            return (var >> 9) + 30;

        case 4:
            return 1;

        case 5:
            return INT32_MAX;
    }
}
