#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "sio.h"
#include "sio_core.h"
#include "statscreen.h"
#include "helpbox.h"

extern u8 gUnk_02000C1C[];

bool sub_8048D60(void * data);

void sub_8048D74(ProcPtr proc)
{
    u8 senderId;
    u16 got = SioReceiveData(gUnk_02000C1C, &senderId, sub_8048D60);

    if (got != 0)
    {
        CloseHelpBox();
        Sio_SetSubState(0);
        LoadHelpBoxGfx((void *) 0x06016800, 0xD);
        StartHelpBoxExt_Unk(0x40, 0x48, 0x6A);
        Proc_Break(proc);
    }
}
