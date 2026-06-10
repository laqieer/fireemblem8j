#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u16 sSendCursor;
extern u16 sWriteCursor;

void SioClearOutgoingQueue(void)
{
    sWriteCursor = sSendCursor;
}
