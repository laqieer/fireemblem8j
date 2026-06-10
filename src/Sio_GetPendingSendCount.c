#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

int Sio_GetPendingSendCount(void)
{
    if (gSioSt->nextPendingWrite >= gSioSt->nextPendingSend)
    {
        return gSioSt->nextPendingWrite - gSioSt->nextPendingSend;
    }
    else
    {
        return SIO_MAX_PENDING_SEND + gSioSt->nextPendingWrite - gSioSt->nextPendingSend;
    }
}
