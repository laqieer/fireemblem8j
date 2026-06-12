#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

bool IsSioBigTransferActive(void)
{
    if (Proc_Find(gProcScr_SioBigSend) == NULL && Proc_Find(gProcScr_SioBigReceive) == NULL)
        return FALSE;

    return TRUE;
}
