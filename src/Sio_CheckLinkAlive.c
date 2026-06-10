#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

bool Sio_CheckLinkAlive(void)
{
    int lastSioCnt = gSioSt->lastSioCnt;
    gSioSt->lastSioCnt = 0;

    if ((lastSioCnt & SIO_MULTI_SD) == 0 && (REG_SIOCNT & SIO_MULTI_SD) == 0)
    {
        gSioSt->unk_020++;
    }
    else
    {
        gSioSt->unk_020 = 0;
    }

    if (gSioSt->unk_020 > 10)
        return FALSE;

    return TRUE;
}
