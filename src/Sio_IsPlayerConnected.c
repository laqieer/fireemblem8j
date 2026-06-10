#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

bool Sio_IsPlayerConnected(u8 playerId)
{
    if (((gSioSt->unk_009 >> playerId) & 1) != 0)
        return TRUE;

    return FALSE;
}
