#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapScreenVSync[];

//! FE8U = 0x080BA718
ProcPtr NewMapScreenVSync(u8 * arg0, u16 * arg1, u8 * arg2, void * arg3, void * arg4)
{
    struct GMapScreenVSyncProc * proc;

    proc = Proc_Start(ProcScr_GMapScreenVSync, NULL);
    if (proc == NULL)
    {
        return NULL;
    }

    proc->unk_2c = arg0;
    proc->unk_30 = arg1;
    proc->unk_34 = arg2;
    proc->unk_38 = 0;
    proc->unk_3c = arg3;
    proc->unk_40 = 0;
    proc->unk_44 = arg4;

    return proc;
}
