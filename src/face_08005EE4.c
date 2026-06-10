
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
int GetFaceDisplayBits(struct FaceProc* proc);
int FaceBlinkProc_GenBlinkInterval(struct FaceBlinkProc* proc);

//! FE8U = 0x08005FE0
void FaceMouth_Loop(struct FaceBlinkProc* proc) {
    int oam1;
    int oam0;

    if (!(GetFaceDisplayBits(proc->pFaceProc) & (FACE_DISP_TALK_1 | FACE_DISP_TALK_2))) {
        int offsetA = (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_SMILE) ? 0 : 24;
        offsetA += 16;

        Register2dChrMove(
            proc->pFaceProc->pFaceInfo->imgMouth + offsetA * 0x20,
            (void*)(((proc->pFaceProc->oam2 + 28) & 0x3FF) * 0x20 + 0x06010000),
            4,
            2
        );

    } else {
        proc->unk_32--;

        if (proc->unk_32 < 0) {
            int offsetB = (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_SMILE) ? 0 : 24;

            proc->unk_32 = ((AdvanceGetLCGRNValue() >> 16) & 7) + 1;
            proc->blinkControl = (proc->blinkControl + 1) & 3;

            switch (proc->blinkControl) {
                case 1:
                case 3:
                    offsetB += 8;
                    break;

                case 2:
                    offsetB += 16;
                    break;

                case 0:
                default:
                    offsetB += 0;
                    break;
            }

            Register2dChrMove(
                proc->pFaceProc->pFaceInfo->imgMouth + offsetB * 0x20,
                (void*)(((proc->pFaceProc->oam2 + 28) & 0x3FF) * 0x20 + 0x06010000),
                4,
                2
            );

        }
    }

    oam1 = 4 - proc->pFaceProc->pFaceInfo->xMouth;

    oam1 = (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;

    oam1 = OAM1_X((oam1 * 8 + proc->pFaceProc->xPos) - 16);

    if (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_FLIPPED) {
        oam1 = oam1 + OAM1_HFLIP;
    }

    if (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_BLEND) {
        oam0 = OAM0_BLEND;
    } else {
        oam0 = 0;
    }

    oam0 += (proc->pFaceProc->yPos + (proc->pFaceProc->pFaceInfo->yMouth * 8)) & 0xFF;

    PutSpriteExt(
        proc->pFaceProc->spriteLayer,
        oam1,
        oam0,
        gObject_32x16,
        proc->pFaceProc->oam2 + 28
    );

    return;
}

//! FE8U = 0x08006134
void FaceBlink_PutEyeSprite(struct FaceBlinkProc* proc, int unk) {
    int oam1;
    int oam0;

    s8 flag = 0;

    switch (unk) {
        case 0:
            unk = 88;
            break;

        case 1:
            unk = 24;
            break;

        case 0x80:
            unk = 88;
            flag = 1;
            break;

        case 0x81:
            unk = 24;
            flag = 1;
            break;

        default:
            return;
    }

    oam1 = 4 - proc->pFaceProc->pFaceInfo->xEyes;

    oam1 = (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_FLIPPED) ? oam1 : -oam1;

    oam1 = ((oam1 * 8 + proc->pFaceProc->xPos) - 16) & 0x1FF;

    if (GetFaceDisplayBits(proc->pFaceProc) & 1) {
        oam1 = oam1 + 0x1000;
    }

    if (GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_BLEND) {
        oam0 = OAM0_BLEND;
    } else {
        oam0 = 0;
    }

    oam0 += (proc->pFaceProc->yPos + (proc->pFaceProc->pFaceInfo->yEyes * 8)) & 0xff;

    if (flag) {
        if (!(GetFaceDisplayBits(proc->pFaceProc) & FACE_DISP_FLIPPED)) {
            oam1 = oam1 + 16;
        }

        PutSpriteExt(
            proc->pFaceProc->spriteLayer,
            oam1,
            oam0,
            gObject_16x16,
            proc->pFaceProc->oam2 + unk + 2
        );
    }
    else {
        PutSpriteExt(
            proc->pFaceProc->spriteLayer,
            oam1,
            oam0,
            gObject_32x16,
            proc->pFaceProc->oam2 + unk
        );
    }

    return;
}

//! FE8U = 0x0800623C
void FaceBlink_Init(struct FaceBlinkProc* proc) {

    proc->pFaceProc = (struct FaceProc*)(proc->proc_parent);
    proc->blinkControl = ((struct FaceProc*)(proc->proc_parent))->pFaceInfo->blinkKind;
    proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
    proc->unk_32 = 0;

    if (proc->blinkControl == 6) {
        proc->blinkControl = 5;
        proc->unk_38 = INT32_MAX;
        proc->unk_32 = 2;
        proc->unk_34 = 6;

        Proc_Goto(proc, 97);
    }

    return;
}

//! FE8U = 0x08006280
void FaceBlink_WaitLoop(struct FaceBlinkProc* proc) {
    int unk;

    proc->unk_38--;

    unk = proc->unk_32;

    if (unk != 0) {
        Proc_Goto(proc, (s16)unk);
        return;
    }

    if (proc->unk_38 < 0) {
        proc->unk_38 = FaceBlinkProc_GenBlinkInterval(proc);
        proc->unk_34 = unk;

        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080062B8
void FaceBlink_AnimLoop(struct FaceBlinkProc* proc) {
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
            break;

    }

    FaceBlink_PutEyeSprite(proc, r5);

    proc->unk_34++;

    return;
}
