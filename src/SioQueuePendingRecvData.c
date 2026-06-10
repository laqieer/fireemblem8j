#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

void SioQueuePendingRecvData(struct SioData * data)
{
    // TODO: clean up

    int i;

    struct SioPending * ent = &gSioSt->pendingRecv[gSioSt->nextPendingRecv];

    ent->packet.head.kind = data->head.kind;
    ent->packet.head.sender = data->head.sender;
    ent->packet.head.param = data->head.param;

    ent->packet.len = data->len;

    for (i = 0; i < data->len; i++)
    {
        ent->packet.bytes[i] = data->bytes[i];
    }

    gSioSt->nextPendingRecv += 1;
    gSioSt->nextPendingRecv &= (SIO_MAX_PENDING_RECV - 1);
}
