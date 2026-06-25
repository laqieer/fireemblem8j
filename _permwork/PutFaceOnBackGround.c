#include "global.h"

extern const u16 gFace_0[];

void PutFaceOnBackGround(u16* a, u16 b, s8 c)
{
    int i;
    int j;
    const u16* src = gFace_0;
    u16* dst = a;

    if (c == 0) {
        for (i = 0; i < 10; i++) {
            const u16* nextSrc = src + 12;
            for (j = 0; j < 12; j++) {
                if (src[j] == 0xFFFF)
                    dst[j] = 0;
                else
                    dst[j] = src[j] + b;
            }
            src = nextSrc;
            dst += 0x20;
        }
    } else {
        for (i = 0; i < 10; i++) {
            for (j = 0; j < 12; j++) {
                if (src[11 - j] == 0xFFFF)
                    dst[j] = 0;
                else
                    dst[j] = src[11 - j] + b + 0x400;
            }
            src += 12;
            dst += 0x20;
        }
    }
}
