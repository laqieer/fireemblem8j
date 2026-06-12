#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

void StartSioBigReceive(void * data, void (*func)(struct SioBigReceiveProc *), ProcPtr parent)
{
    struct SioBigReceiveProc * proc;

    proc = Proc_StartBlocking(gProcScr_SioBigReceive, parent);

    proc->func = func;
    proc->data = data;
    proc->completionPercent = 0;
    proc->currentBlock = 0;
    proc->unk_3C = 0;
}
