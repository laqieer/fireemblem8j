#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

extern u8 sSioCnt;
struct SioRegs
{
    u16 siocnt;
    u16 siodata;
};
#define SIO ((struct SioRegs *)(&REG_SIOCNT))

int SioSend16(u16 * word, int arg_1)
{
    if (gSioSt->selfId == -1)
        return -1;

    SIO->siodata = *word;

    if (gSioSt->selfId == 0 && arg_1 < 0)
    {
        REG_SIOCNT = sSioCnt | SIO_MULTI_MODE | SIO_INTR_ENABLE | SIO_ENABLE;
    }

    return 0;
}
