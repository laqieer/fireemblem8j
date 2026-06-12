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

void SioBigReceive_RecvHeader(struct SioBigReceiveProc * proc)
{
    u8 data[4];
    u8 id;

    u16 got = SioReceiveData(&data, &id, NULL);

    if (got != 0)
    {
        proc->unk_34 = data[0];
        proc->blockCount = (data[1] << 8) + (data[2] & 0xFF);
        proc->lastBlockLen = data[3];

        Proc_Break(proc);
    }
}
