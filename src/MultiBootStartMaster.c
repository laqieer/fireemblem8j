#include "global.h"
#include "sio.h"

//! FE8U = 0x0804EBF0
void MultiBootStartMaster(struct MultiBootParam * mp, const u8 * srcp, int length, u8 palette_color, s8 palette_speed)
{
    int i;
    int speed = palette_speed;

    if (mp->probe_count != 0 || mp->client_bit == 0 || mp->check_wait != 0)
    {
        MultiBootInit(mp);
        return;
    }

    mp->boot_srcp = srcp;
    length = (length + 15) & ~15;
    if (length < MULTIBOOT_SEND_SIZE_MIN || length > MULTIBOOT_SEND_SIZE_MAX)
    {
        MultiBootInit(mp);
        return;
    }

    mp->boot_endp = srcp + length;

    switch (palette_speed)
    {
        case -4:
        case -3:
        case -2:
        case -1:
            i = (palette_color << 3) | (3 - speed);
            break;
        case 0:
            i = 0x38 | palette_color;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            i = (palette_color << 3) | (speed - 1);
            break;
    }

    mp->palette_data = ((i & 0x3f) << 1) | 0x81;
    mp->probe_count = 0xd0;
}
