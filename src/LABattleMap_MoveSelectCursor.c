#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "sio.h"
#include "sio_core.h"

extern u8 gSioBattlemap_2[];

//! FE8U = 0x0804A920
void LABattleMap_MoveSelectCursor(u16 keys, s8 flag)
{
    u8 r2;
    int r4;
    int r5;
    int iflag = flag;

    r2 = gUnk_Sio_16.unk_02;
    r5 = r2;
    gUnk_Sio_16.unk_03 = gUnk_Sio_16.unk_02;

    if ((keys & DPAD_ANY) == 0)
    {
        return;
    }

    r4 = r2 << 2;

    if ((keys & DPAD_UP) != 0)
    {
        r2 = gSioBattlemap_2[r4 + 0];
    }
    else if ((keys & DPAD_DOWN) != 0)
    {
        r2 = gSioBattlemap_2[r4 + 1];
    }
    else if ((keys & DPAD_LEFT) != 0)
    {
        r2 = gSioBattlemap_2[r4 + 2];
    }
    else if ((keys & DPAD_RIGHT) != 0)
    {
        r2 = gSioBattlemap_2[r4 + 3];
    }

    r5 = r2 - r5;

    if ((gUnk_Sio_16.unk_03 == 0) && ((keys & DPAD_LEFT) != 0))
    {
        r5 = -1;
    }

    if ((gUnk_Sio_16.unk_03 == 19) && ((keys & DPAD_DOWN) != 0))
    {
        r5 = +1;
    }

    while (1)
    {
        if (gUnk_42[r2] != 0)
        {
            if (iflag == 0 || (gUnk_42[r2] >> 6) != gSioSt->selfId)
            {
                goto _end; // FIXME: Goto appears to be required for match
            }
        }

        if (r5 < 0)
        {
            r2--;

            if (r2 == 0xFF)
            {
                r2 = 19;
            }
        }
        else
        {
            r2++;
            r2 = r2 % 20;
        }
    }

_end:
    gUnk_Sio_16.unk_02 = r2;

    return;
}
