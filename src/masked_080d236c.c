#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

bool RemovePromoTraineeEventFace(void)
{
    u16 start = gFaces[0]->xPos;
    s16 cmp = start;

    if (cmp > 0x150) {
        return 0;
    } else {
        struct FaceProc *b = gFaces[1];
        struct FaceProc *c = gFaces[2];
        struct FaceProc *d = gFaces[3];
        gFaces[0]->xPos = start + 4;
        d->xPos = start + 4;
        c->xPos = start + 4;
        b->xPos = start + 4;

        return 1;
    }
}
