#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

// extern aliases of the sio_core static state (shared via baseline_syms data
// binds: sSioCnt/sSendCursor/sWriteCursor/sReadCursor/sRecvCursor live in the
// sio_core_08041880.o(.bss) region @ 0x030017D8; this TU references the same
// RAM through the global aliases rather than re-declaring file-local statics).
extern u8 sSioCnt;
extern u16 sSendCursor;
extern u16 sWriteCursor;
extern u16 sRecvCursor[4];

extern u16 EWRAM_DATA gSioOutgoing[0x200];
extern u16 EWRAM_DATA gSioIncoming[0x200][4];

// COMMON
extern u32 gUnk_71;
extern u32 gUnk_72;

struct SioRegs
{
    u16 siocnt;
    u16 siodata;
};

#define SIO ((struct SioRegs *)(&REG_SIOCNT))

void SioHandleIrq_Serial(void)
{
    int i;
    u16 recv[4];
    u16 var_08;
    u16 siocnt;

    u16 sb = 0;

    // TODO: constants, cleanup

    gUnk_72 = 1;
    gSioSt->unk_01E = 0;
    gUnk_71 = 1;
    gSioSt->recvFlags = 0;

    REG_TM3CNT_H = 0;

    gSioSt->lastSioCnt = siocnt = REG_SIOCNT;

    if (gSioSt->unk_004 != 6)
    {
        gSioSt->selfId = (siocnt >> 4) & 3;
    }

    // ew
    *(u64 *)(recv) = REG_SIOMLT_RECV;

    REG_SIOCNT = sSioCnt | SIO_MULTI_MODE | SIO_INTR_ENABLE;
    SIO->siodata = 0x7FFF;

    for (i = 0; i < 4; i++)
    {
        if (recv[i] != 0 && recv[i] != 0xFFFF)
        {
            if (gSioSt->playerStatus[i] == PLAYER_STATUS_0)
                gSioSt->playerStatus[i] = PLAYER_STATUS_1;

            gSioSt->recvFlags |= 1 << i;
        }
        else
        {
            if (Sio_IsPlayerConnected(i) == TRUE)
            {
                if (gSioSt->lastRecv[i] == 0xFFFF)
                {
                    gSioSt->timeoutClock[i]++;
                }
                else
                {
                    gSioSt->timeoutClock[i] = 0;
                }
            }
        }

        gSioSt->lastRecv[i] = gSioIncoming[sRecvCursor[i]][i] = recv[i];

        sRecvCursor[i] = (sRecvCursor[i] + 1) & 0x1FF;
    }

    if (gSioSt->unk_004 > 4)
    {
        switch (gSioSt->unk_001)
        {
            case 1:
                if (sWriteCursor != sSendCursor)
                {
                    var_08 = gSioOutgoing[sSendCursor];
                    sSendCursor = (sSendCursor + 1) & 0x1FF;
                    SioSend16(&var_08, 1);
                }

                if (gSioSt->selfId == 0 && gSioSt->unk_1B7C != 0)
                {
                    REG_TM3CNT = -gSioSt->unk_1B7C;
                    REG_TM3CNT_H = 0xC3;
                }

                break;

            case 3:
                if (gSioSt->selfId != 0)
                {
                    SioSend16(&gSioSt->unk_030, 1);
                    gSioSt->unk_030 = 0x5FFF;
                }

                for (i = 0; i < 4; i++)
                {
                    // JP: 0x1286 (fe8u 0x1288; 0x9ABC in mgfembp)
                    if (Sio_IsPlayerConnected(i) && recv[i] != 0x1286)
                        sb++;
                }

                if (sb == 0)
                    gSioSt->unk_1B7E = 1;

                break;
        }
    }

    gUnk_71 = 0;
}
