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

//! FE8U = 0x08005B04
void StartFaceChibiSpr(int x, int y, int fid, int chr, int pal, s8 isFlipped, ProcPtr parent) {
    struct FaceProc* proc;
    int f = isFlipped;

    UnpackFaceChibiSprGraphics(fid, chr, pal);

    proc = Proc_Start(gProcScr_FaceChibiSpr, parent);

    proc->xPos = x;
    proc->yPos = y;

    proc->oam2 = chr + ((pal & 0xF) * 0x1000);

    if (f) {
       proc->sprite = Sprite_Face_1;
    } else {
       proc->sprite = Sprite_Face_0;
    }

    return;
}
