#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "worldmap.h"

s8 GMapScreenVSync_AddCopyRequest(struct GMapScreenVSyncProc * proc, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);

//! FE8U = 0x080BA818
void GMapScreenVSync_RequestFullCopy(ProcPtr proc, int a, int b)
{
    int a_ = a % 0x3c;
    int b_ = b % 0x28;

    if (a_ + 0x20 > 0x20)
    {
        int c = 0x20 - a_;
        GMapScreenVSync_AddCopyRequest(proc, a_, b_, a, b, c, 0x16);
        GMapScreenVSync_AddCopyRequest(proc, a_ + c, b_, a + c, b, 0x20 - c, 0x16);
    }
    else
    {
        GMapScreenVSync_AddCopyRequest(proc, a_, b_, a, b, 0x20, 0x16);
    }

    return;
}
