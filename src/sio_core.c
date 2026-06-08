#include "sio_core.h"

#include "sioerror.h"
#include "soundwrapper.h"

#include <string.h> // memcpy, TODO: remvoe

struct SioSt EWRAM_DATA gSioStInstance = { 0 };

struct SioSt * SHOULD_BE_CONST gSioSt = &gSioStInstance;

u16 EWRAM_DATA gSioOutgoing[0x200] = { 0 };
u16 EWRAM_DATA gSioIncoming[0x200][4] = { 0 };

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

int SioPollingMsg(void)
{
    u16 siocnt;

    switch (gSioStateId)
    {
        case 0:
            REG_RCNT = 0;

            SIO->siodata = ~gSioSt->unk_1B78;
            SIO->siocnt = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE;

            siocnt = REG_SIOCNT;

            if ((siocnt & SIO_MULTI_SD) != 0)
            {
                sSioId = siocnt & SIO_MULTI_SI;

                if (sSioId != 0)
                    sSioId = -1;

                gUnk_72 = 0;
                gSioStateId = 1;
            }

            return -1;

        case 1:
            siocnt = REG_SIOCNT;

            if (gUnk_72 != 0 && (siocnt & SIO_ERROR) == 0 && gSioSt->lastRecv[1] != UINT16_MAX)
            {
                sSioId = (siocnt & SIO_ID) >> 4; // TODO: shift constant
                gSioStateId = 2;

                return sSioId;
            }
            else
            {
                SIO->siodata = ~gSioSt->unk_1B78;

                if (sSioId != 0)
                {
                    REG_SIOCNT = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE;
                }
                else
                {
                    REG_SIOCNT = sSioCnt | SIO_INTR_ENABLE | SIO_MULTI_MODE | SIO_MULTI_BUSY;
                }

                return -1;
            }

        default:
            return sSioId;
    }
}

int GetSioIndex(void)
{
    return (REG_SIOCNT & SIO_ID) >> 4; // TODO: shift constant
}

void Sio_SetCommParams(u16 arg_0, u16 sioCnt, u16 arg_2)
{
    gSioSt->unk_1B78 = arg_0;
    gSioSt->unk_1B7A = sioCnt;
    gSioSt->unk_1B7C = arg_2;
    sSioCnt = sioCnt;
}

void Sio_ResetSession(void)
{
    int j, i;

    // TODO: constants

    gUnk_71 = 0;

    gSioSt->unk_022 = 0;
    gSioSt->selfSeq = 0;
    gSioSt->nextPendingSend = 0;
    gSioSt->nextPendingWrite = 0;
    gSioSt->nextPendingRead = 0;
    gSioSt->nextPendingRecv = 0;
    gSioSt->unk_01E = 0;
    gSioSt->unk_01F = 0;
    gSioSt->unk_020 = 0;
    gSioSt->unk_030 = 0;

    for (i = 0; i < 4; i++)
    {
        gSioSt->playerStatus[i] = PLAYER_STATUS_0;
        gSioSt->lastRecv[i] = 0;
        gSioSt->timeoutClock[i] = 0;
        gSioSt->seq[i] = 0;
    }

    for (i = 0; i < SIO_MAX_PACKET; i++)
    {
        gUnk_75[i] = 0;
        gSioSt->buf[i] = 0;
    }

    for (j = 0; j < SIO_MAX_PENDING_SEND; j++)
    {
        struct SioPending * ent = &gSioSt->pendingSend[j];

        ent->unk_00 = 0;
        ent->packet.head.kind = 0;

        for (i = 0; i < (int)ARRAY_COUNT(ent->packet.bytes); i++)
            ent->packet.bytes[i] = 0;
    }

    for (j = 0; j < SIO_MAX_PENDING_RECV; j++)
    {
        struct SioPending * ent = &gSioSt->pendingRecv[j];

        ent->unk_00 = 0;
        ent->packet.head.kind = 0;

        for (i = 0; i < (int)ARRAY_COUNT(ent->packet.bytes); i++)
            ent->packet.bytes[i] = 0;
    }

    sSendCursor = sWriteCursor = 0;

    for (i = 0; i < 0x200; i++)
    {
        gSioOutgoing[i] = 0;
    }

    for (j = 0; j < 4; j++)
    {
        sReadCursor[j] = sRecvCursor[j] = 0;

        for (i = 0; i < 0x200; i++)
        {
            gSioIncoming[i][j] = 0;
        }
    }
}
