
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
int FindFreeFaceSlot(void);
struct FaceProc* StartFace(int slot, int fid, int x, int y, int disp);
int GetFaceDisplayBits(struct FaceProc* proc);

//! FE8U = 0x080055BC
void Face_OnIdle(struct FaceProc* proc) {
    int oam0;

    if (GetFaceDisplayBits(proc) & FACE_DISP_HIDDEN) {
        return;
    }

    if (GetFaceDisplayBits(proc) & FACE_DISP_BLEND) {
        oam0 = OAM0_BLEND;
    } else {
        oam0 = 0;
    }

    oam0 += OAM0_Y(proc->yPos);

    PutSpriteExt(
        proc->spriteLayer,
        0x1FF & proc->xPos,
        oam0,
        proc->sprite,
        proc->oam2
    );

    return;
}

//! FE8U = 0x08005610
struct FaceProc* StartFaceAuto(int fid, int x, int y, int disp) {

    int slot = FindFreeFaceSlot();

    if (slot < 0) {
        return NULL;
    }

    return StartFace(slot, fid, x, y, disp);
}
