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

//! FE8U = 0x08005570
int FindFreeFaceSlot(void) {
    int i;

    for (i = 0; i < FACE_SLOT_COUNT; i++) {
        if (gFaces[i] == NULL) {
            return i;
        }
    }

    return -1;
}
