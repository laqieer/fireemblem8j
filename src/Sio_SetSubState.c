#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

void Sio_SetSubState(int arg_0)
{
    gSioSt->unk_021 = arg_0;
}
