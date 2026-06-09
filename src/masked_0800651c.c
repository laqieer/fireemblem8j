
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











































//! FE8U = 0x08006618
void SetFacePosition(int slot, int x, int y) {

    gFaces[slot]->xPos = x;
    gFaces[slot]->yPos = y;

    return;
}
