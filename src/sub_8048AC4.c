#include "global.h"

#include "soundwrapper.h"
#include "sio.h"
#include "sio_core.h"

void m4aSoundVSyncOn(void);

void sub_8048AC4(ProcPtr proc)
{
    u16 data = 0x2586;

    Proc_Start(ProcScr_SIOVSYNC, PROC_TREE_VSYNC);
    Proc_Start(ProcScr_SIOMAIN, proc);
    Proc_Start(ProcScr_SIOCON, proc);

    SioSend16(&data, -1);

    m4aSoundVSyncOn();

    return;
}
