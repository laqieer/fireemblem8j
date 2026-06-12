#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe

extern struct SioSt EWRAM_DATA gSioStInstance;

extern struct SioSt * SHOULD_BE_CONST gSioSt;

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];

static u8 sSioCnt;
static int sSioId;
static struct SioPending * sUnk_0;
static u32 sUnk_1;

static u16 sSendCursor;
static u16 sWriteCursor;
static u16 sReadCursor[4];
static u16 sRecvCursor[4];

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

void SioRegisterIrq(void)
{
    // Multi-Player mode SIO
    REG_RCNT = 0;
    REG_SIOCNT = sSioCnt | SIO_MULTI_MODE;

    REG_TM3CNT_H = 0;

    gUnk_72 = gUnk_71 = 0;
    gSioStateId = 0;
    sSioId = -1;

    SetIRQHandler(7, SioHandleIrq_Serial);
    SetIRQHandler(6, SioHandleIrq_Timer3);

    REG_IE |= INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;
}
