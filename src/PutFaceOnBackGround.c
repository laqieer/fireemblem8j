#include "global.h"

extern const u16 gFace_0[];

//! FE8U = 0x08006738
// JP 0x0800663C region-different: the JP build colors the loop temporaries
// differently from fe8u (which is NON_MATCHING there). Porting the loop with
// the next-iteration temporaries hoisted (nextSrc/nextDst/nextI) reproduces the
// JP register allocation byte-for-byte. (decomp.me fork jmNW8, score 0)
void PutFaceOnBackGround(u16 *a, u16 b, s8 c)
{
    int i;
    int j;
    int flipped = c;
    const u16 *src = gFace_0;
    u16 *dst = a;

    if (flipped == 0) {
        for (i = 0; i < 10; i++) {
            const u16 *nextSrc;
            int nextI;
            u16 *nextDst;

            nextSrc = src + 12;
            nextDst = dst + 0x20;
            nextI = i + 1;

            for (j = 0; j < 12; j++) {
                if (src[j] == 0xFFFF)
                    dst[j] = 0;
                else
                    dst[j] = src[j] + b;
            }

            src = nextSrc;
            dst = nextDst;
            i = nextI - 1;
        }
    } else {
        for (i = 0; i < 10; i++) {
            const u16 *nextSrc;
            int nextI;
            u16 *nextDst;

            nextSrc = src + 12;
            nextDst = dst + 0x20;
            nextI = i + 1;

            for (j = 0; j < 12; j++) {
                if (src[11 - j] == 0xFFFF)
                    dst[j] = 0;
                else
                    dst[j] = (src[11 - j] + b) + 0x400;
            }

            src = nextSrc;
            dst = nextDst;
            i = nextI - 1;
        }
    }
}
