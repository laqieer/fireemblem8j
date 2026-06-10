#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

bool Sio_IsPlayerActiveThisFrame(u8 playerId)
{
    if (((gSioSt->recvFlags >> playerId) & 1) != 0)
        return TRUE;

    return FALSE;
}
