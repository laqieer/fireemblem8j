#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"
#include <string.h> // memcpy, TODO: remvoe

int StartSioBigSend(void * data, u32 len, void (*func)(struct SioBigSendProc *), u8 arg_3, ProcPtr parent)
{
    struct SioBigSendProc * proc;

    u8 lastBlockLen;
    u16 blockCount;

    if (len > SIO_MAX_DATA * UINT16_MAX)
        return -1;

    blockCount = len / SIO_MAX_DATA + 1;

    if (len % SIO_MAX_DATA != 0)
        blockCount++;

    lastBlockLen = len % SIO_MAX_DATA;

    proc = Proc_StartBlocking(gProcScr_SioBigSend, parent);

    proc->data = data;
    proc->unk_34 = arg_3;
    proc->func = func;
    proc->blockCount = blockCount;
    proc->lastBlockLen = lastBlockLen;
    proc->completionPercent = 0;
    proc->currentBlock = 0;
    proc->unk_3C = 0;

    return 0;
}
