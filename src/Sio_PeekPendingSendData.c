#include "global.h"
#include "sio_core.h"
#include "sio.h"

extern struct SioPending * sUnk_0;

struct SioData * Sio_PeekPendingSendData(u32 * out)
{
    if (gSioSt->pendingSend[gSioSt->nextPendingSend].packet.head.kind != 0xCF) // JP: 0xCF (US SIO_MSG_DATA=0x8F) -- region-different msg id
        return NULL;

    sUnk_0 = &gSioSt->pendingSend[gSioSt->nextPendingSend];

    *out = gSioSt->pendingSend[gSioSt->nextPendingSend].packet.len;
    return &gSioSt->pendingSend[gSioSt->nextPendingSend].packet;
}
