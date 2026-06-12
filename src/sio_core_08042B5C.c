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
void Sio_ResetSession(void);

void SioBigReceive_Init(struct SioBigReceiveProc * proc)
{
    gSioSt->selfSeq = gSioSt->unk_022 = gSioSt->unk_02E = 0;

    gSioSt->seq[0] = gSioSt->seq[1] = gSioSt->seq[2] = gSioSt->seq[3] = 0;

    Sio_ResetSession();
}
