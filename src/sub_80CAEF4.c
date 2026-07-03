#include "global.h"


void sub_80CAEF4(int a, int b)
{
    register unsigned char *buf asm("r8");
    unsigned char *vram;
    register unsigned char *vramInit asm("r1");
    int pass;

    buf = (unsigned char *)0x02020188;
    vramInit = (unsigned char *)0x06013400;
    vram = vramInit;
    asm("" : "+m"(a), "+m"(b), "+m"(vram));

    {
        register int btmp asm("r5");

        btmp = b;
        if (btmp != 0) {
            btmp++;
            b = btmp;
        }
    }

    pass = 0;

outer_loop:
    {
        register int row asm("r4");
        int nextPass;

        row = b;
        nextPass = pass + 1;
        asm("" : "+m"(nextPass));

        {
            register int cmpA asm("r0");

            cmpA = a;
            if (row > cmpA)
                goto no_rows;
        }

        {
            register int maskHi asm("r9");
            register int maskInit asm("r1");

            maskInit = 0xF0;
            asm("" : "=r"(maskInit) : "0"(maskInit));
            maskHi = maskInit;

        row_loop:
            {
                register int tile asm("r2");
                register int nextRow asm("sl");
                int odd;
                register int seven asm("r5");
                register int hiOff asm("r1");
                register int limitMask asm("r0");
                register int half asm("r4");
                register unsigned char *base asm("r5");
                register unsigned char *dstHiBase asm("r3");
                register unsigned char *dstLo asm("r6");
                register unsigned char *dstHi asm("r5");
                register unsigned char *srcHiBase asm("r1");
                register unsigned char *srcLoBase asm("r2");
                register int count asm("ip");
                register unsigned char *srcLo asm("r3");
                register unsigned char *srcHi asm("r2");

                tile = row >> 3;
                seven = row + 1;
                asm("" : "=r"(seven) : "0"(seven));
                nextRow = seven;
                odd = row;
                asm("" : "=r"(odd) : "0"(odd));
                limitMask = 1;
                odd &= limitMask;
                seven = 7;
                hiOff = seven - tile;
                limitMask = 0x3FF;
                hiOff &= limitMask;
                hiOff <<= 5;
                row &= seven;
                asm("" : "=r"(row) : "0"(row));
                half = row >> 1;
                base = vram;
                dstHiBase = base + hiOff;
                dstHiBase += 3;
                tile += 8;
                tile &= limitMask;
                tile <<= 5;
                limitMask = (int)(base + tile);
                dstLo = (unsigned char *)(limitMask + half);
                dstHi = dstHiBase - half;
                srcHiBase = buf + hiOff;
                srcHiBase += 3;
                srcLoBase = buf + tile;
                count = 7;
                srcLo = srcLoBase + half;
                srcHi = srcHiBase - half;

            inner_loop:
                {
                    register int val asm("r1");
                    register int mask asm("r0");

                    if (odd == 0)
                        goto even_row;

                    val = *dstHi;
                    mask = 0xF;
                    mask &= val;
                    val = *srcHi;
                    mask |= val;
                    *srcHi = mask;

                    val = *dstLo;
                    mask = maskHi;
                    goto store_low;

                even_row:
                    val = *dstHi;
                    mask = maskHi;
                    mask &= val;
                    val = *srcHi;
                    mask |= val;
                    *srcHi = mask;

                    val = *dstLo;
                    mask = 0xF;

                store_low:
                    mask &= val;
                    val = *srcLo;
                    mask |= val;
                    *srcLo = mask;
                }

                dstLo += 4;
                dstHi += 4;
                srcLo += 4;
                srcHi += 4;
                {
                    register int neg asm("r1");
                    register int cmp asm("r0");

                    neg = 1;
                    neg = -neg;
                    asm("" : "=r"(neg) : "0"(neg));
                    count += neg;
                    cmp = count;

                    if (cmp >= 0)
                        goto inner_loop;
                }

                row = nextRow;
            }

            {
                register int cmpA2 asm("r1");

                cmpA2 = a;
                if (row <= cmpA2)
                    goto row_loop;
            }
        }

    no_rows:

        {
            register int inc asm("r0");
            register unsigned char *vramNext asm("r5");

            inc = 0x400;
            buf += inc;
            vramNext = vram;
            vramNext += inc;
            vram = vramNext;
        }
        pass = nextPass;
    }

    if (pass <= 3)
        goto outer_loop;

    {
        register unsigned char *copySrc asm("r8");
        register int idx asm("r5");
        register int mask asm("r6");
        register int i asm("r4");

        copySrc = (unsigned char *)0x02020188;
        idx = 0x230;
        mask = 0x3FF;
        i = 3;

    copy_loop:
        CpuFastSet(copySrc, (unsigned char *)0x06010000 + ((idx & mask) << 5), 0x80);
        {
            register int inc asm("r1");

            inc = 0x400;
            asm("" : "=r"(inc) : "0"(inc));
            copySrc += inc;
        }
        idx += 0x20;
        i--;
        if (i >= 0)
            goto copy_loop;
    }
}
