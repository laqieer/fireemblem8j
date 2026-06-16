#include "global.h"
#include "sio.h"


int MultiBootHandShake(struct MultiBootParam * mp)
{
    int i, j;

#define send_data (mp->system_work[0])
#define must_data (mp->system_work[1])

    switch (mp->probe_count)
    {
    case_0xe0:
    case 0xe0:
        mp->probe_count = 0xe1;
        must_data = 0x0000;
        send_data = 0x100000;
        return MultiBootSend(mp, 0x0000);

        default:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((mp->client_bit & (1 << i)) && j != must_data)
                {
                    goto case_0xe0;
                }
            }
            mp->probe_count++;
            must_data = send_data & 0xffff;
            if (send_data == 0x0000)
            {
                must_data = mp->masterp[0xac] | (mp->masterp[0xad] << 8);
                send_data = must_data << 5;
            }
            send_data >>= 5;
        output_common:
            return MultiBootSend(mp, send_data);

        case 0xe7:
        case 0xe8:
            for (i = MULTIBOOT_NCHILD; i != 0; i--)
            {
                j = REG_SIOMULTI(i);
                if ((mp->client_bit & (1 << i)) && j != must_data)
                {
                    MultiBootInit(mp);
                    return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
                }
            }

            mp->probe_count++;
            if (mp->probe_count == 0xe9)
            {
                return 0;
            }

            send_data = mp->masterp[0xae] | (mp->masterp[0xaf] << 8);
            must_data = send_data;
            goto output_common;
    }

#undef send_data
#undef must_data
}
