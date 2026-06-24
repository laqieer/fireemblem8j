#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"

extern u16 sReadCursor[4];
extern u16 sRecvCursor[4];

s16 Sio_ReadPacket(s8 playerId, void * dst)
{
#define DST_U16 ((u16 *)dst)

    int i;

    u16 magic;

    u16 sum_a = 0;
    u16 recv_sum_a;
    u16 sum_b = 0;
    u16 recv_sum_b;

    u16 count;
    u16 lookahead;
    u16 len;

    if (sReadCursor[playerId] == sRecvCursor[playerId])
        return -2;

    if (gSioIncoming[sReadCursor[playerId]][playerId] != 0x4FFF)
    {
        while (sReadCursor[playerId] != sRecvCursor[playerId])
        {
            sReadCursor[playerId] += 1;
            sReadCursor[playerId] &= 0x1FF;

            if (gSioIncoming[sReadCursor[playerId]][playerId] == 0x4FFF &&
                sReadCursor[playerId] != sRecvCursor[playerId])
            {
                goto yes;
            }
        }

        return -4;
    }

yes:
    if (sRecvCursor[playerId] < sReadCursor[playerId])
    {
        count = 0x200 - sReadCursor[playerId] + sRecvCursor[playerId];
    }
    else
    {
        count = sRecvCursor[playerId] - sReadCursor[playerId];
    }

    if (count <= 4)
        return -4;

    if (sReadCursor[playerId] + 1 < 0x200)
    {
        lookahead = sReadCursor[playerId] + 1;
    }
    else
    {
        lookahead = 0;
    }

    len = gSioIncoming[lookahead][playerId];

    if (len > SIO_MAX_PACKET)
    {
        sReadCursor[playerId] += 1;
        sReadCursor[playerId] &= 0x1FF;

        return -4;
    }

    if (len + 6 > count)
    {
        return -2;
    }

    sReadCursor[playerId] += 2;
    sReadCursor[playerId] &= 0x1FF;

    recv_sum_a = gSioIncoming[sReadCursor[playerId]][playerId];

    sReadCursor[playerId] += 1;
    sReadCursor[playerId] &= 0x1FF;

    recv_sum_b = gSioIncoming[sReadCursor[playerId]][playerId];

    sReadCursor[playerId] += 1;
    sReadCursor[playerId] &= 0x1FF;

    sum_a += 0x4FFF + len;

    for (i = 0; i < len; i++)
    {
        u32 data = gSioIncoming[sReadCursor[playerId]][playerId];
        u32 frag = data * (i + 1);

        sum_a = sum_a + frag;
        sum_b = sum_b + ~frag;

        DST_U16[i] = data;

        sReadCursor[playerId] += 1;
        sReadCursor[playerId] &= 0x1FF;
    }

    if (sum_a != recv_sum_a || sum_b != recv_sum_b)
    {
        return -3;
    }

    return len * 2;

#undef DST_U16
}
