#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "sio.h"
#include "sio_core.h"
#include "statscreen.h"
#include "helpbox.h"

extern u8 gUnk_02000C04[];

bool sub_8048C68(void * data);

void sub_8048C7C(ProcPtr proc)
{
    u8 senderId;
    u16 got = SioReceiveData(gUnk_02000C04, &senderId, sub_8048C68);

    if (got != 0)
    {
        if (gUnk_02000C04[4] == 0)
        {
            LoadHelpBoxGfx((void *) 0x06015000, 6);
            StartHelpBoxExt_Unk(0x38, 0x38, 0x69);
            Proc_Goto(proc, 10);
        }
        else
        {
            *(int *)((char *)proc + 0x58) = 0;
            Proc_Break(proc);
        }
    }
}
