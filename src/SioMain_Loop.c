#include "global.h"
#include "sio_core.h"
#include "sioerror.h"
#include "soundwrapper.h"

extern struct SioPending *sUnk_0;

void SioMain_Loop(void)
{
    int i, j;

    // TODO: clean up

    if (gSioSt->unk_001 != 1)
        return;

    gSioSt->unk_00F |= 1 << gSioSt->selfId;

    for (i = 0; i < 4; i++)
    {
        u16 len;

    redo:
        len = Sio_ReadPacket(i, gSioSt->buf);

        if (len != 0)
        {
            switch (len)
            {
                struct SioMessage * message;
                struct SioData * data_message;

                case 0x0A:
                case 0x16:
                case 0x2A:
                case 0x2E:
                case 0x80:
                    data_message = (void *)gSioSt->buf;

                    if (data_message->head.kind != SIO_MSG_8C)
                    {
                        if (data_message->head.kind != SIO_MSG_DATA)
                            break;

                        if (data_message->head.sender == gSioSt->selfId)
                            break;

                        if (data_message->head.param != gSioSt->seq[data_message->head.sender])
                        {
                            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
                            gSioMsgBuf.sender = (gSioSt->selfId << 4) | data_message->head.sender;
                            gSioMsgBuf.param = gSioSt->seq[data_message->head.sender];

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

                            goto redo;
                        }
                        else
                        {
                            SioQueuePendingRecvData(data_message);

                            gSioMsgBuf.kind = SIO_MSG_DATA_ACK;
                            gSioMsgBuf.sender = (gSioSt->selfId << 4) | data_message->head.sender;
                            gSioMsgBuf.param = gSioSt->seq[data_message->head.sender] + 1;

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                        }

                        break;
                    }

                    for (j = 0; j < 15; j++)
                    {
                        gLinkArenaSt.unk_A1[i][j] = data_message->bytes[j];
                    }

                    if ((Sio_IsPlayerConnected(i) == 0 && gSioSt->unk_000 == data_message->head.param && gSioSt->unk_004 <= 5) ||
                        (Sio_IsPlayerConnected(i) == 1))
                    {
                        if (gSioSt->selfId == 0)
                        {
                            gSioMsgBuf.kind = SIO_MSG_86;
                            gSioMsgBuf.sender = gSioSt->selfId;
                            gSioMsgBuf.param = i;

                            SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                        }

                        break;
                    }

                    if (gSioSt->selfId == 0)
                    {
                        u32 cmd = gSioSt->unk_000 != data_message->head.param ? SIO_MSG_87 : SIO_MSG_85;

                        gSioMsgBuf.kind = cmd;
                        gSioMsgBuf.sender = gSioSt->selfId;
                        gSioMsgBuf.param = i;

                        SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));
                    }

                    break;

                case 0x04:
                    message = (void *)gSioSt->buf;

                    switch (message->kind)
                    {
                        case SIO_MSG_89:
                            gSioSt->unk_00A |= 1 << message->sender;
                            break;

                        case SIO_MSG_DATA_ACK:
                            if (gSioSt->unk_02E != 0)
                            {
                                if ((message->sender >> 4) != gSioSt->selfId &&
                                    (message->sender & 0x0F) == gSioSt->selfId &&
                                    (message->param == (u16)(gSioSt->selfSeq + 1)))
                                {
                                    gSioSt->unk_00F |= 1 << (message->sender >> 4);
                                    sUnk_0->unk_00 = gSioSt->unk_00F;

                                    if ((gSioSt->unk_00F & gSioSt->unk_009) == gSioSt->unk_009)
                                    {
                                        gSioSt->selfSeq++;
                                        gSioSt->pendingSend[gSioSt->nextPendingSend].packet.head.kind = 0;
                                        gSioSt->nextPendingSend++;
                                        gSioSt->nextPendingSend &= (SIO_MAX_PENDING_SEND - 1);
                                        gSioSt->unk_02E = 0;
                                        gSioSt->unk_010 = gSioSt->unk_011 = gSioSt->unk_00F = 0;
                                    }
                                }
                            }

                            break;

                        case SIO_MSG_87:
                            if (Sio_IsPlayerConnected(message->param) == 0)
                            {
                                gSioSt->playerStatus[gSioSt->selfId] = PLAYER_STATUS_2;
                                gSioSt->playerStatus[(gSioSt->lastSioCnt & 0x30) >> 4] = PLAYER_STATUS_2;
                                gSioSt->playerStatus[message->param] = PLAYER_STATUS_2;
                                gSioSt->unk_004 = 6;
                            }

                            break;

                        case SIO_MSG_85:
                            if (Sio_IsPlayerConnected(message->param) == 0)
                            {
                                gSioSt->playerStatus[message->param] = PLAYER_STATUS_2;
                                gSioSt->unk_004 = 6;
                            }

                            break;

                        case SIO_MSG_86:
                            gLinkArenaSt.linking_status[message->param] = 1;
                            gSioSt->playerStatus[message->param] = PLAYER_STATUS_5;
                            gSioSt->unk_009 |= 1 << message->param;
                            gSioSt->timeoutClock[message->param] = 0;
                            break;

                        case SIO_MSG_84:
                            Sio_PlayRemoteSoundEffect(message->sender);
                            break;
                    }

                    break;
            }
        }
    }
}
