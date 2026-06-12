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

//! FE8U = 0x08005D98
void FaceBgBlink_AnimLoop(struct FaceBlinkProc* proc) {
    const struct FaceData* info;
    u16* ptrA;
    u16* ptrB;
    int offset;

    int tileref = (proc->palId << 12) + (0x3FF & proc->tileId);

    info = GetPortraitData(proc->faceId);

    offset = 0;

    switch (proc->unk_34) {
        case 3:
            offset = 88;
            break;

        case 0:
        case 6:
            offset = 24;
            break;

        case 9:

            PutFace80x72_Standard(proc->unk_3c, (proc->palId << 12) + (0x3FF & proc->tileId), info);

            BG_EnableSync(GetBackgroundFromBufferPointer(proc->unk_3c));

            Proc_Break(proc);

            return;

        case 1:
        case 2:
        case 4:
        case 5:
        case 7:
        case 8:
            proc->unk_34++;
            return;
    }

    info = GetPortraitData(proc->faceId);

    ptrA = ((info->yEyes << 5) + proc->unk_3c) + info->xEyes;

    ptrB = ptrA - 1;

    *(ptrB + 0x00 + 0) = tileref + offset + 0x00 + 0;
    *(ptrB + 0x00 + 1) = tileref + offset + 0x00 + 1;
    *(ptrB + 0x00 + 2) = tileref + offset + 0x00 + 2;
    *(ptrB + 0x00 + 3) = tileref + offset + 0x00 + 3;

    *(ptrA + 0x20 - 1) = tileref + offset + 0x20 + 0;
    *(ptrA + 0x20 + 0) = tileref + offset + 0x20 + 1;
    *(ptrA + 0x20 + 1) = tileref + offset + 0x20 + 2;
    *(ptrA + 0x20 + 2) = tileref + offset + 0x20 + 3;

    BG_EnableSync(GetBackgroundFromBufferPointer(ptrB));

    proc->unk_34++;

    return;
}
