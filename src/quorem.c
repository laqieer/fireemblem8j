#include "global.h"
#include <sys/reent.h>

typedef struct _Bigint _Bigint;

int __mcmp(_Bigint *a, _Bigint *b);

#define Storeinc(a, b, c)                                                      \
    (((unsigned short *)a)[0] = (unsigned short)b,                             \
     ((unsigned short *)a)[1] = (unsigned short)c, a++)

int quorem(_Bigint *b, _Bigint *S)
{
    int n;
    long borrow, y;
    ULong q, carry, ys;
    ULong *bx, *bxe, *sx, *sxe;
    ULong si, zs;
    long z;
    register ULong dvd asm("sl");

    n = S->_wds;
    if (b->_wds < n)
        return 0;
    sx = S->_x;
    sxe = sx + --n;
    bx = b->_x;
    bxe = bx + n;
    {
        ULong d = *sxe + 1;
        q = (dvd = *bxe) / d;
    }
    if (q)
    {
        borrow = 0;
        carry = 0;
        do
        {
            si = *sx++;
            ys = (si & 0xffff) * q + carry;
            zs = (si >> 16) * q + (ys >> 16);
            carry = zs >> 16;
            y = (*bx & 0xffff) - (ys & 0xffff) + borrow;
            borrow = y >> 16;
            z = (*bx >> 16) - (zs & 0xffff) + borrow;
            borrow = z >> 16;
            Storeinc(bx, z, y);
        } while (sx <= sxe);
        if (!dvd)
        {
            bx = b->_x;
            while (--bxe > bx && !*bxe)
                --n;
            b->_wds = n;
        }
    }
    if (__mcmp(b, S) >= 0)
    {
        q++;
        borrow = 0;
        carry = 0;
        bx = b->_x;
        sx = S->_x;
        do
        {
            si = *sx++;
            ys = (si & 0xffff) + carry;
            zs = (si >> 16) + (ys >> 16);
            carry = zs >> 16;
            y = (*bx & 0xffff) - (ys & 0xffff) + borrow;
            borrow = y >> 16;
            z = (*bx >> 16) - (zs & 0xffff) + borrow;
            borrow = z >> 16;
            Storeinc(bx, z, y);
        } while (sx <= sxe);
        bx = b->_x;
        bxe = bx + n;
        if (!*bxe)
        {
            while (--bxe > bx && !*bxe)
                --n;
            b->_wds = n;
        }
    }
    return q;
}
