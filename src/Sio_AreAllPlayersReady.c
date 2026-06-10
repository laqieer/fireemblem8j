#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

bool Sio_AreAllPlayersReady(void)
{
    int i, count = 0;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->playerStatus[i] == PLAYER_STATUS_5)
            count++;
    }

    if ((gSioSt->unk_009 == 0x3 && count == 2) || (gSioSt->unk_009 == 0x7 && count == 3) ||
        (gSioSt->unk_009 == 0xF && count == 4))
    {
        return TRUE;
    }

    return FALSE;
}
