#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u16 sSendCursor;
extern u16 sWriteCursor;

s16 SioSend(const void * src, u16 len)
{
#define SRC_U16 ((u16 const *)src)

    int i;

    u16 magic;

    u16 sum_a = 0;
    u16 sum_b = 0;

    u16 cur = sWriteCursor;

    if (len > SIO_MAX_PACKET)
        return -1;

    len = len / 2;
    magic = 0x4FFF;
    sum_a = magic + len;

    // write headers

    gSioOutgoing[cur] = magic;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    gSioOutgoing[cur] = len;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    // compute checksum

    for (i = 0; i < len; i++)
    {
        u32 frag = SRC_U16[i] * (i + 1);

        sum_a = sum_a + frag;
        sum_b = sum_b + ~frag;
    }

    // write checksum

    gSioOutgoing[cur] = sum_a;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    gSioOutgoing[cur] = sum_b;
    cur = cur + 1;
    cur = cur & 0x1FF;

    if (cur == sSendCursor)
        return -1;

    // write data

    for (i = 0; i < len; i++)
    {
        gSioOutgoing[cur] = SRC_U16[i];
        cur = cur + 1;
        cur = cur & 0x1FF;

        if (cur == sSendCursor)
            return -1;
    }

    sWriteCursor = cur;

    return len;

#undef SRC_U16
}
