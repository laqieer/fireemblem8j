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

void Face_OnInit(struct FaceProc* proc) {
    Decompress(proc->pFaceInfo->img, (void *)(sFaceConfig[proc->faceSlot].tileOffset + 0x06010000));
    return;
}
