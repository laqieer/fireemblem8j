#include "global.h"
#include <stdio.h>
#include <reent.h>

/* newlib fflush (libc.a fflush.o) -- JP 0x080D8AEC */

#define __SLBF 0x0001
#define __SNBF 0x0002

#define _REENT _impure_ptr

#define CHECK_INIT(fp)                                                                             \
    do                                                                                             \
    {                                                                                              \
        if ((fp)->_data == 0)                                                                      \
            (fp)->_data = _REENT;                                                                  \
        if (!(fp)->_data->__sdidinit)                                                              \
            __sinit((fp)->_data);                                                                  \
    } while (0)

extern int _fwalk(struct _reent *, int (*)(FILE *));
extern void __sinit(struct _reent *);

int fflush(register FILE *fp)
{
    register unsigned char *p;
    register int n, t;

    if (fp == NULL)
        return _fwalk(_REENT, fflush);

    CHECK_INIT(fp);

    t = fp->_flags;
    if ((t & __SWR) == 0 || (p = fp->_bf._base) == NULL)
        return 0;
    n = fp->_p - p;

    fp->_p = p;
    fp->_w = t & (__SLBF | __SNBF) ? 0 : fp->_bf._size;

    while (n > 0)
    {
        t = (*fp->_write)(fp->_cookie, (char *)p, n);
        if (t <= 0)
        {
            fp->_flags |= __SERR;
            return EOF;
        }
        p += t;
        n -= t;
    }
    return 0;
}
