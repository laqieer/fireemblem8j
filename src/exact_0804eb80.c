#include "global.h"
#include "sio.h"

// clang-format off

#define MULTIBOOT_MASTER_INFO            0x62
#define MULTIBOOT_CLIENT_INFO            0x72
#define MULTIBOOT_MASTER_START_PROBE     0x61
#define MULTIBOOT_MASTER_REQUEST_DLREADY 0x63
#define MULTIBOOT_CLIENT_DLREADY         0x73
#define MULTIBOOT_MASTER_START_DL        0x64
#define MULTIBOOT_MASTER_REQUEST_CRC     0x65
#define MULTIBOOT_CLIENT_CALC_CRC        0x74
#define MULTIBOOT_CLIENT_CRCREADY        0x75
#define MULTIBOOT_MASTER_VERIFY_CRC      0x66

/* prototypes for same-file helpers called by this run */
void MultiBootInit(struct MultiBootParam * mp);

//! FE8U = 0x0804DDF0
int MultiBootSend(struct MultiBootParam * mp, u16 data)
{
    int i;

    i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_MULTI_SD | SIO_MULTI_SI);
    if (i != SIO_MULTI_SD)
    {
        MultiBootInit(mp);
        return i ^ SIO_MULTI_SD;
    }

    REG_SIODATA8 = data;
    REG_SIOCNT = SIO_MULTI_MODE | SIO_START | SIO_115200_BPS;

    mp->sendflag = 1;
    return 0;
}
