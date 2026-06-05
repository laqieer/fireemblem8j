

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

// clang-format on

//! FE8U = 0x0804D9C4
void MultiBootInit(struct MultiBootParam * mp)
{
    mp->client_bit = 0;
    mp->probe_count = 0;
    mp->response_bit = 0;

    mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
    mp->sendflag = 0;

    mp->handshake_timeout = 0;

    REG_RCNT = 0;
    REG_SIOCNT = SIO_MULTI_MODE | SIO_115200_BPS;
    REG_SIODATA8 = 0;
}
