#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

int SioReceiveData(void * dst, u8 * outSenderId, bool (*verify)(void *))
{
    u8 i;
    u8 sender_id;

    struct SioData * dat = &gSioSt->pendingRecv[gSioSt->nextPendingRead].packet;

    if (dat->head.kind != SIO_MSG_DATA || dat->head.sender == gSioSt->selfId)
        return 0;

    if (dat->head.param != gSioSt->seq[dat->head.sender])
    {
        gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
        gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
        gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

        dat->head.kind = 0;

        gSioSt->nextPendingRead += 1;
        gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

        // recursion!
        return SioReceiveData(dst, outSenderId, verify);
    }
    else
    {
        for (i = 0; i < dat->len; i++)
        {
            ((u8 *)dst)[i] = dat->bytes[i];
        }

        if (verify != NULL && !verify(dst))
        {
            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
            gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
            gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

            dat->head.kind = 0;

            gSioSt->nextPendingRead += 1;
            gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

            // recursion!
            return SioReceiveData(dst, outSenderId, verify);
        }
        else
        {
            dat->head.kind = 0;

            sender_id = dat->head.sender;

            gSioSt->seq[dat->head.sender] += 1;

            gSioSt->nextPendingRead += 1;
            gSioSt->nextPendingRead &= (SIO_MAX_PENDING_RECV - 1);

            *outSenderId = sender_id;

            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
            gSioMsgBuf.sender = (gSioSt->selfId << 4) | dat->head.sender;
            gSioMsgBuf.param = gSioSt->seq[dat->head.sender];

            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

            return dat->len;
        }
    }
}
