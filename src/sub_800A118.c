#include "global.h"
#include "bmlib.h"
#include "bmio.h"

extern struct MsgBuffer sMsgString;

//! FE8U = 0x0800A030
char * StrInsertTact(void)
{
    u8 * r5 = sMsgString.buffer4;
    u8 * dst = sMsgString.buffer5;

    CopyString(r5, sMsgString.buffer1);
    while (*r5 != 0)
    {
        if (*r5 < '\x20')
            *dst++ = *r5++;
        else if (*r5 != '\x80')
        {
            *dst++ = *r5++;
            *dst++ = *r5++;
        }
        else
        {
            r5++;
            if (*r5 != '\x20')
            {
                *dst++ = '\x80';
                *dst++ = *r5++;
            }
            else
            {
                /* [Tact]: "\x20\x80" */
                CopyString(dst, GetTacticianName());
                while (*dst != 0)
                    dst++;
                r5++;
            }
        }
    }
    *dst = 0;
    return sMsgString.buffer5;
}
