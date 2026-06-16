#include "global.h"
#include "sio_core.h"
#include "sio.h"

extern u32 sUnk_1;

int SioEmitData(u8 const * src, u16 len)
{
    int result;
    u8 i;

    struct SioData * dat;

    sUnk_1 = 1;

    gSioSt->pendingSend[gSioSt->nextPendingWrite].unk_00 = 0;
    dat = &gSioSt->pendingSend[gSioSt->nextPendingWrite].packet;

    dat->head.kind = 0xCF; // JP: SIO_MSG_DATA 0xCF (US 0x8F) -- region-different msg id
    dat->head.sender = gSioSt->selfId;
    dat->head.param = gSioSt->unk_022;
    dat->len = len;

    gSioSt->unk_022++;

    for (i = 0; i < len; i++)
    {
        dat->bytes[i] = src[i];
    }

    result = gSioSt->nextPendingWrite;

    gSioSt->nextPendingWrite += 1;
    gSioSt->nextPendingWrite &= (SIO_MAX_PENDING_SEND - 1);

    sUnk_1 = 0;

    return result;
}
