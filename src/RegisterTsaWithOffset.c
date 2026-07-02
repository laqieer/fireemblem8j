#include "global.h"
#include "classchg.h"

//! FE8U = 0x0800B... (fe8u classchg-sel.c RegisterTsaWithOffset is NON_MATCHING here)
// JP 0x080D19DC region-different: the fe8u-shaped C (see src/nonmatching) leaves
// 91/96 bytes wrong -- the JP build colors with higher register pressure (keeps
// _dst in r8 and jrange<<16 as the loop counter). Pinning those temporaries to
// their JP registers reproduces the allocation byte-for-byte.
// (decomp.me fork 39OxE, score 0)

struct Struct_8A30978
{
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

void RegisterTsaWithOffset(u16 *_dst, u16 *_src, u32 offset)
{
    int i;
    int j;
    int jStart;
    register int dec asm("r0");
    register int step asm("r5");
    int prevJ;
    int jCheck;
    register int nextI asm("r2");
    register u16 *base asm("r8");
    register u16 *src asm("r4");
    register int jrange asm("r6");
    u16 *dst;
    u32 word;
    u8 mask;
    struct Struct_8A30978 *b = (void *) _src;
    u16 add;

    base = _dst;
    add = offset;
    src = b->longBuffer;
    mask = 0xff;
    word = *((u32 *) b);
    jrange = b->a;
    i = (word >> 8) & mask;
    if (i > 0xc)
    {
        jStart = jrange << 16;
        do
        {
            dst = base + (i * 32);
            jCheck = jrange;
            nextI = i - 1;
            if (jCheck >= 0)
            {
                dec = 0xFFFF0000;
                step = jStart;
                j = step + dec;
                step = dec;
                do
                {
                    *(dst++) = (*(src++)) + add;
                    prevJ = j;
                    j += step;
                } while (prevJ >= 0);
            }

            do
            {
                dec = nextI << 16;
                i = dec >> 16;
            } while (0);
        } while (i > 0xc);
    }
}
