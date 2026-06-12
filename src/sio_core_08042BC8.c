#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe

extern struct SioSt EWRAM_DATA gSioStInstance;

extern struct SioSt * SHOULD_BE_CONST gSioSt;

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];











// COMMON
extern u32 gUnk_71;
extern u32 gUnk_72;
extern u32 gSioStateId;
extern struct SioMessage gSioMsgBuf;
extern u8 gUnk_75[SIO_MAX_PACKET];

// clang-format off





// clang-format on

// TODO: what to do here? This is improvable
struct SioRegs
{
    u16 siocnt;
    u16 siodata;
};

#define SIO ((struct SioRegs *)(&REG_SIOCNT))

/* prototypes for same-file helpers called by this run */
int SioReceiveData(void * dst, u8 * outSenderId, bool (*verify)(void *));

void SioBigReceive_Loop(struct SioBigReceiveProc * proc)
{
    int i;
    u8 id;

    u8 * buf = gGenericBuffer;

    if (proc->currentBlock < proc->blockCount - 1)
    {
        u16 got = SioReceiveData(proc->data, &id, NULL);

        if (got != 0)
        {
            proc->data += SIO_MAX_DATA;
            proc->completionPercent = proc->currentBlock * 100 / proc->blockCount;
            proc->currentBlock++;
        }
    }
    else
    {
        u16 got = SioReceiveData(buf, &id, NULL);

        if (got != 0)
        {
            for (i = 0; i < proc->lastBlockLen; i++)
            {
                *((u8 *)proc->data) = buf[i];
                proc->data++;
            }

            proc->completionPercent = proc->currentBlock * 100 / proc->blockCount;
            proc->currentBlock++;
        }
    }

    if (proc->func != NULL)
        proc->func(proc);

    if (proc->currentBlock >= proc->blockCount)
        Proc_Break(proc);
}
