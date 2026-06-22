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

//! FE8U = 0x0804E790
int MultiBootMain(struct MultiBootParam * mp)
{
    int i;
    int j;
    int k;

    if (MultiBootCheckComplete(mp))
    {
        return 0;
    }

    if (mp->check_wait > MULTIBOOT_CONNECTION_CHECK_WAIT)
    {
        mp->check_wait--;
        return 0;
    }

output_burst:
    if (mp->sendflag)
    {
        mp->sendflag = 0;

        i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_ERROR | SIO_ID | SIO_MULTI_SD | SIO_MULTI_SI);
        if (i != SIO_MULTI_SD)
        {
            MultiBootInit(mp);
            return i ^ SIO_MULTI_SD;
        }
    }

    if (mp->probe_count >= 0xe0)
    {
        i = MultiBootHandShake(mp);
        if (i)
        {
            return i;
        }

        if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK && mp->probe_count > 0xe1 && MultiBootCheckComplete(mp) == 0)
        {
            MultiBootWaitSendDone();
            goto output_burst;
        }

        if (MultiBootCheckComplete(mp) == 0)
        {
            if (mp->handshake_timeout == 0)
            {
                MultiBootInit(mp);
                return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
            }
            mp->handshake_timeout--;
        }

        return 0;
    }

    switch (mp->probe_count)
    {
        case 0:
            k = 0x0e;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (REG_SIOMULTI(i) != 0xffff)
                {
                    break;
                }
                k >>= 1;
            }

            k &= 0x0e;
            mp->response_bit = k;

            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if (mp->client_bit & (1 << i))
                {
                    if (j != ((MULTIBOOT_CLIENT_INFO << 8) | (1 << i)))
                    {
                        k = 0;
                        break;
                    }
                }
            }

            mp->client_bit &= k;

            if (k == 0)
            {
                mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
            }

            if (mp->check_wait)
            {
                mp->check_wait--;
            }
            else
            {
                if (mp->response_bit != mp->client_bit)
                {
                    MultiBootStartProbe(mp);
                    goto case_1;
                }
            }

        output_master_info:
            return MultiBootSend(mp, (MULTIBOOT_MASTER_INFO << 8) | mp->client_bit);

        case_1:
        case 1:
            mp->probe_target_bit = 0;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((j >> 8) == MULTIBOOT_CLIENT_INFO)
                {
                    gUnk_50[i - 1] = j;
                    j &= 0xff;
                    if (j == (1 << i))
                    {
                        mp->probe_target_bit |= j;
                    }
                }
            }

            if (mp->response_bit != mp->probe_target_bit)
            {
                goto output_master_info;
            }

            mp->probe_count = 2;
            return MultiBootSend(mp, (MULTIBOOT_MASTER_START_PROBE << 8) | mp->probe_target_bit);

        case 2:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (mp->probe_target_bit & (1 << i))
                {
                    j = REG_SIOMULTI(i);
                    if (j != gUnk_50[i - 1])
                    {
                        mp->probe_target_bit ^= 1 << i;
                    }
                }
            }
            goto output_header;

        case 0xd0:
            k = 1;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                mp->client_data[i - 1] = j;
                if (mp->probe_target_bit & (1 << i))
                {
                    if ((j >> 8) != MULTIBOOT_CLIENT_INFO && (j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                    {
                        MultiBootInit(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY;
                    }
                    if (j == gUnk_50[i - 1])
                    {
                        k = 0;
                    }
                }
            }

            if (k == 0)
            {
                return MultiBootSend(mp, (MULTIBOOT_MASTER_REQUEST_DLREADY << 8) | mp->palette_data);
            }

            mp->probe_count = 0xd1;

            k = 0x11;
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                k += mp->client_data[i - 1];
            }
            mp->handshake_data = k;
            return MultiBootSend(mp, (MULTIBOOT_MASTER_START_DL << 8) | (k & 0xff));

        case 0xd1:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if (mp->probe_target_bit & (1 << i))
                {
                    if ((j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                    {
                        MultiBootInit(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY;
                    }
                }
            }

            i = MultiBoot(mp);

            if (i == 0)
            {
                mp->probe_count = 0xe0;
                mp->handshake_timeout = MULTIBOOT_HANDSHAKE_TIMEOUT;
                return 0;
            }
            MultiBootInit(mp);
            mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT * 2;
            return MULTIBOOT_ERROR_BOOT_FAILURE;

        default:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                if (mp->probe_target_bit & (1 << i))
                {
                    j = REG_SIOMULTI(i);
                    if ((j >> 8) != (MULTIBOOT_MASTER_START_PROBE + 1 - (mp->probe_count >> 1)) ||
                        ((j & 0xff) != (1 << i)))
                    {
                        mp->probe_target_bit ^= 1 << i;
                    }
                }
            }

            if (mp->probe_count == 0xc4)
            {
                mp->client_bit = mp->probe_target_bit & 0x0e;
                mp->probe_count = 0;
                goto output_master_info;
            }

        output_header:
            if (mp->probe_target_bit == 0)
            {
                MultiBootInit(mp);
                return MULTIBOOT_ERROR_NO_PROBE_TARGET;
            }

            mp->probe_count += 2;
            if (mp->probe_count == 0xc4)
            {
                goto output_master_info;
            }
            i = MultiBootSend(mp, (mp->masterp[mp->probe_count - 4 + 1] << 8) | mp->masterp[mp->probe_count - 4]);

            if (i)
            {
                return i;
            }
            if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK)
            {
                MultiBootWaitSendDone();
                goto output_burst;
            }
            return 0;
    }
}
