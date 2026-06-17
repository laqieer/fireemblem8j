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

void EndFaceIn8Frames(struct FaceProc* target) {
    struct DeleteFaceProc* proc = Proc_Start(gProcScr_FaceEndIn8Frames, PROC_TREE_3);

    proc->target = target;

    return;
}
