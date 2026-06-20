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

//! FE8U = 0x08005894
void PutFaceTm(u16 * tm, u8* data, int tileref, s8 isFlipped) {
    int flip = isFlipped;
    int ix;
    int iy;

    int width = *data++;
    int height = *data++;

    u8* it = data;

    if (flip == 0) {

        for (iy = 0; iy < height; iy++) {
            for (ix = 0; ix < width; ix++) {

                if (*it == 0xFF) {
                    it++;
                    continue;
                }

                tm[TILEMAP_INDEX(ix, iy)] = *it++ + tileref;
            }
        }
    } else {
        for (iy = 0; iy < height; iy++) {
            for (ix = width - 1; ix >= 0; ix--) {

                if (*it == 0xFF) {
                    it++;
                    continue;
                }

                tm[TILEMAP_INDEX(ix, iy)] = *it++ + tileref + 0x400;
            }
        }
    }

    return;
}
