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

//! FE8U = 0x08005988
void PutFaceChibi(int fid, u16 * tm, int chr, int pal, s8 isFlipped) {
    UnpackFaceChibiGraphics(fid, chr, pal);

    chr &= 0x3FF;
    PutFaceTm(tm, gFace_1, TILEREF(chr, pal), isFlipped);

    return;
}
