#include "global.h"
#include "proc.h"
#include "hardware.h"

// JP-only worldmap/augury (uranai) menu proc @ 0x080A3274
// The pointer at 0x085775CC (aka gKeyStatusPtr) is reused here as a config ptr.

extern int sub_80922DC(void);
extern void sub_8002DE4(ProcPtr proc);

void sub_80A3274(ProcPtr proc)
{
    struct KeyStatusBuffer* s;

    if (!(u8)sub_80922DC())
    {
        sub_8002DE4(proc);
        return;
    }

    s = gKeyStatusPtr;
    if (s->newKeys & 8)
    {
        struct PlaySt* p;

        Proc_Goto(proc, 0);
        p = &gPlaySt;
        if (((u8*)p)[0x41] << 30 >= 0)
            m4aSongNumStart(0x6B);
    }
}
