#include "global.h"

#include "proc.h"
#include "hardware.h"
#include "sio.h"
#include "sio_core.h"
#include "statscreen.h"
#include "helpbox.h"

extern u8 gUnk_02000C00[];

bool sub_8048BF0(void * data);

void sub_8048C08(ProcPtr proc)
{
    u8 senderId;
    u16 got = SioReceiveData(gUnk_02000C00, &senderId, sub_8048BF0);

    if (got != 0)
    {
        int val = gUnk_02000C00[0];

        if (val == 0)
        {
            Proc_Break(proc);
        }
        else if (val >= 0)
        {
            if (val <= 2)
            {
                LoadHelpBoxGfx((void *) 0x06015000, 6);
                StartHelpBoxExt_Unk(0x38, 0x38, 0x68);
                Proc_Goto(proc, 10);
            }
        }
    }
}
