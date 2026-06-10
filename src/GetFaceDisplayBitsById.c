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

//! FE8U = 0x080057A8
int GetFaceDisplayBitsById(int slot) {
    return GetFaceDisplayBits(gFaces[slot]);
}
